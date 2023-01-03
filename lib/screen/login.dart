import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_tiket/screen/dashboard.dart';
import 'package:project_tiket/screen/google_signup.dart';
import 'package:project_tiket/screen/register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
void main() => runApp(const Login());

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  static const String _title = 'MAPS';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xfF1C1D27),
        body: const LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
    bool visible = false;

  final String sUrl = "http://10.0.2.2/Web_Server_GM/php/";

  _cekLogin() async {
    setState(() {
      visible = true;
    });
    final prefs = await SharedPreferences.getInstance();
    var params = "restAPI.php?function=get_login&&username=" +
        usernameController.text +
        "&password=" +
        passwordController.text;

    try {
      var res = await http.get(Uri.parse(sUrl + params));
      if (res.statusCode == 200) {
        var response = json.decode(res.body);
        if (response['status'] == 1) {
          prefs.setBool('slogin', true);
          setState(() {
            visible = false;
          });
           Alert(
              context: context,
              title: "Success",
              desc: "Login Berhasil",
              type: AlertType.success,
              buttons: [
                DialogButton(
                    child: Text('OK',
                        style: TextStyle(color: Colors.white, fontSize: 26)),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      Navigator.push(
              context, MaterialPageRoute(builder: (context) => dashboard()));
                    })
              ]).show();
          
        }else {
          prefs.setBool('slogin', false);
          setState(() {
            visible = false;
          });    
          
        }
      }
    } catch (e) {
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
                      Navigator.of(context, rootNavigator: true).pop();
                    })
              ]).show();

    }
  }
   
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10, bottom: 2, top: 10),
              child: Text(
                'Login Account',
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
                  'Hello Welcome Back to Our Account!',
                  style: GoogleFonts.poppins(
                      color: Color(0xfFA9A7A7),
                      fontWeight: FontWeight.normal,
                      fontSize: 13),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: <Widget>[
                    Image.asset("assets/images/icon_awal.png"),
                  ],
                )),
            Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
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
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
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
            Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(top: 10, right: 10),
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.outfit(
                      color: Color(0xfF4285F4),
                      fontWeight: FontWeight.normal,
                      fontSize: 14),
                )),
            SizedBox(
              height: 50.0,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Color.fromARGB(51, 77, 51, 138),
                  ),
                  onPressed: () {
                    _cekLogin();
                  }
                  ),
            ),
            // SizedBox(height: 10),
            // Row(
            //   children: <Widget>[
            //     Image.asset("assets/images/orsignupwith.png"),
            //   ],
            // mainAxisAlignment: MainAxisAlignment.center,
            // ),
            SizedBox(height: 10),
            // Row(
            //   children: <Widget>[
            //     Image.asset("assets/images/logo_google.png"),
            //     TextButton(
            //       child: Text(
            //         'Google',
            //         style: TextStyle(color: Colors.white,
            //         fontSize: 14),
            //       ),onPressed: () {
            //         //signup screen
            //         Navigator.push(context,
            //             MaterialPageRoute(builder: (context) => signup_google()));
            //       },
            //     )
            //   ],
            // mainAxisAlignment: MainAxisAlignment.center,
            // ),
            Row(
              children: <Widget>[
                Text('Not register yet?',
                style: GoogleFonts.outfit(
                  color: Color(0xfFA9A7A7),
                  fontSize: 13)),
                TextButton(
                  child: Text(
                    'Create Account',
                    style: GoogleFonts.outfit(color: Colors.white,
                    fontSize: 15),
                  ),
                  onPressed: () {
                    //signup screen
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => register()));
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
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
