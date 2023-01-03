
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CinemaSeat extends StatefulWidget {
  
   bool isReserved;

   bool isSelected;

   CinemaSeat({Key? key, this.isSelected = false, this.isReserved = false}) : super(key: key);

  @override
  _cinemaSeatState createState() => _cinemaSeatState();
}

class _cinemaSeatState extends State<CinemaSeat> {
  final String url =
      'http://10.0.2.2/Web_Server_GM/php/restAPI.php?function=get_film';

  Future getFilm() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () {
        setState(() {
          !widget.isReserved ? widget.isSelected = !widget.isSelected : null;
        });
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
          width: MediaQuery.of(context).size.width / 10,
          height: MediaQuery.of(context).size.width / 10,
          decoration: BoxDecoration(
              color: widget.isSelected
                  ? Color(0xFF6C61AF)
                  : !widget.isSelected ? Color(0xfF514F64) : null,   
              borderRadius: BorderRadius.circular(5.0)
              ),
              ),
    
    );

    

  }
}