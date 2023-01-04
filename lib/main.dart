import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:project_tiket/screen/dashboard.dart';
import 'package:project_tiket/screen/homepage.dart';
import 'package:project_tiket/screen/login.dart';
import 'package:project_tiket/screen/pilih_kursi.dart';
import 'package:get/get.dart';
import 'package:project_tiket/screen/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/images/GM_TICH.png',),
        splashIconSize: 1000,
        duration: 3500,
        splashTransition: SplashTransition.scaleTransition,
        centered: true,
        backgroundColor: Colors.white,
        nextScreen: Login(),
      ),
    );
  }
}
