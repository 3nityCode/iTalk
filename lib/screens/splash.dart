import 'dart:developer';

import 'package:flutter/services.dart';

import 'home.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: []);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    log('message');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _homeScreen(),
        builder: (context, snapshot) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFFFF800B),Color(0xFFCE1010),]
              ),
            ),
          );
        },
      )
    );
  }

  Future<String> _homeScreen() async {
    var routePage = MaterialPageRoute(
      builder: (context) => HomeScreen(title: 'uTalk')
    );
    await Future.delayed(Duration(seconds: 3)).then((value){
      Navigator.pushReplacement(context, routePage);
    });
    return 'home';
  }

}