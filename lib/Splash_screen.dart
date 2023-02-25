import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vehicle/screens/login-screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return
       Center(
        child: Container(
          child: Image.asset(
            'images/splash.jpg',
            fit: BoxFit.cover,
          ),
        ),
      );

  }
}
