import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pde/data/constants.dart';
import 'package:pde/screens/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            color: Colors.white,
            child: IntroductionScreen(
              pages: [
                PageViewModel(
                    title: "QADOQLASH",
                    decoration: getPageDecoration(),
                    body: "You can set alarm for feeding time of your pet",
                    image: buildImage("assets/images/qadoqlash.png")),
                PageViewModel(
                    title: "YETKAZIB BERISH",
                    decoration: getPageDecoration(),
                    body: "You can set alarm for feeding time of your pet",
                    image: buildImage("assets/images/yetkazish.png")),
                PageViewModel(
                    title: "EXPORT QILISH",
                    decoration: getPageDecoration(),
                    body: "You can set alarm for feeding time of your pet",
                    image: buildImage("assets/images/eksport.png")),
              ],
              dotsDecorator: DotsDecorator(
                  size: const Size.square(10.0),
                  activeSize: const Size(20.0, 10.0),
                  activeColor: textColor,
                  color: Colors.black26,
                  spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0))),
              done: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.white)),
                color: Colors.greenAccent,
                child: Text(
                  "Start",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              onDone: () => goToHome(context),
              showNextButton: true,
              next: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.white)),
                color: textColor,
                onPressed: () {  },
                child: Text(
                  "Next",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              // showNextButton: true,
              showSkipButton: false,
              // skip: Text(
              //   "Skip",
              //   style: TextStyle(
              //       fontSize: 14,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.black87),
              // ),
            )),
      ),
    );
  }

  Future<void> goToHome(context) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool("intro", true);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => AuthScreen()));
  }

  Widget buildImage(String path) => Center(
        child: Image.asset(path, width: 250),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 30, color: textColor),
        bodyTextStyle: TextStyle(fontSize: 20, color: Colors.black45),
        // descriptionPadding: EdgeInsets.all(16),
        // imagePadding: EdgeInsets.all(30),
        // pageColor: Colors.white
      );
}
