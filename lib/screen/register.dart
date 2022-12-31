import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_tiket/screen/dashboard.dart';
import 'package:project_tiket/screen/google_signup.dart';
import 'package:project_tiket/screen/login.dart';
import 'package:project_tiket/service/dataUserService.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(const register());

class register extends StatelessWidget {
  const register({Key? key}) : super(key: key);

  static const String _title = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        backgroundColor: Color(0xfF1C1D27),
        body: const RegisterPage(),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int count = 0;
  void createDataUser() {
    UserService()
        .add_user('', usernameController.text, passwordController.text,
            emailController.text, phoneController.text, '', '1')
        .then((value) {
      setState(() {
        if (value) {
          Alert(
              context: context,
              title: "Success",
              desc: "Registrasi Berhasil",
              type: AlertType.success,
              buttons: [
                DialogButton(
                    child: Text('OK',
                        style: TextStyle(color: Colors.white, fontSize: 26)),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    })
              ]).show();
        } else {
          Alert(
              context: context,
              title: "Gagal",
              desc: "Registrasi Gagal",
              type: AlertType.error,
              buttons: [
                DialogButton(
                    child: Text('OK',
                        style: TextStyle(color: Colors.white, fontSize: 26)),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]).show();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 10, bottom: 2, top: 10),
                child: Text(
                  'Create Account',
                  style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Please input your data information!',
                  style: GoogleFonts.poppins(
                      color: Color(0xfFA9A7A7),
                      fontWeight: FontWeight.normal,
                      fontSize: 13),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: GoogleFonts.outfit(
                      fontWeight: FontWeight.normal,
                      color: Color(0xfF6F6F6F),
                      fontSize: 14,
                    ),

                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: GoogleFonts.outfit(
                      fontWeight: FontWeight.normal,
                      color: Color(0xfF6F6F6F),
                      fontSize: 14,
                    ),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email Addres',
                    labelStyle: GoogleFonts.outfit(
                      fontWeight: FontWeight.normal,
                      color: Color(0xfF6F6F6F),
                      fontSize: 14,
                    ),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: GoogleFonts.outfit(
                      fontWeight: FontWeight.normal,
                      color: Color(0xfF6F6F6F),
                      fontSize: 14,
                    ),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                    child: Text('Register'),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Color.fromARGB(51, 77, 51, 138),
                    ),
                    onPressed: () {
                      createDataUser();
                    }),
              ),
              Row(
                children: <Widget>[
                  Text('Alredy have account?',
                      style: GoogleFonts.outfit(
                          color: Color(0xfFA9A7A7), fontSize: 13)),
                  TextButton(
                    child: Text(
                      'Sign In',
                      style:
                          GoogleFonts.outfit(color: Colors.white, fontSize: 15),
                    ),
                    onPressed: () {
                      //signup screen
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          )),
    );
  }

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return OutlineInputBorder(
      //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: Color(0xfF6F6F6F),
      ),
    );
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: Colors.white));
  }
}
