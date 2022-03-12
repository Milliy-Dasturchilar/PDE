import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pde/data/constants.dart';
import 'package:pde/screens/auth.dart';
import 'package:pde/screens/home.dart';
import 'package:pde/screens/intro.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey("intro") && prefs.containsKey("number")) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
      } else if(prefs.containsKey("intro")){
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return AuthScreen();
        }));
      }
      else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return IntroScreen();
        }));
      }
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (BuildContext context) => number=="null"?AuthScreen():HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                softWrap: true,
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "PDE",
                    style: TextStyle(
                        fontFamily: "Roboto", color: textColor, fontSize: 36),
                    children: [
                      TextSpan(
                          text: "\thelper",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              color: Colors.black54,
                              fontSize: 24)),
                      // TextSpan(
                      //     text: "Dev>",
                      //     style: TextStyle(
                      //         fontFamily: "Roboto",
                      //         color: Colors.greenAccent,
                      //         fontSize: 26)),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
