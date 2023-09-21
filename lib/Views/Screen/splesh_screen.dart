import 'dart:async';

import 'package:flutter/material.dart';

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
    Timer(
        const Duration(
          seconds: 6,
        ), () {
      Navigator.of(context).pushReplacementNamed('home_page');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          //color: Colors.red,
          alignment: Alignment.center,
          child: Image.asset("assets/image/splashscreen_gif.gif"),
        ),
      ),
    );
  }
}
