
import 'package:flutter/material.dart';
import 'package:project_tiket/screen/dashboard.dart';
import 'package:project_tiket/screen/homepage.dart';
import 'package:project_tiket/screen/login.dart';
import 'package:project_tiket/screen/pilih_tiket_view.dart';
import 'package:get/get.dart';
import 'package:project_tiket/screen/register.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: dashboard(),
    );
  }
}
