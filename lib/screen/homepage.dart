import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class homepage extends StatelessWidget {
  const homepage({super.key});
  final String url = 'http://10.0.2.2/Web_Server_GM/php/restAPI.php?function=get_colab';

  Future getCollab() async{
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    getCollab();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body:FutureBuilder(
          future: getCollab(),
          builder: ((context, snapshot){
            return ListView.builder(
              itemCount: snapshot.data["data"].length,
              itemBuilder: (context, index) {
                return Text(snapshot.data["data"][index]["alamat_studio"]);
              });
          }), 
      ),
    );
  }
}