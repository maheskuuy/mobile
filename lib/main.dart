import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:project_tiket/screen/dashboard.dart';
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
    home: AnimatedSplashScreen(splash: Icons.adb_sharp,
    duration: 3000,
    splashTransition: SplashTransition.rotationTransition,
    backgroundColor: Colors.white,
     nextScreen: Login(),
    ),
    );
  }
}
