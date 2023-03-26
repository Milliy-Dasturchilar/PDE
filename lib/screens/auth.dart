import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:pde/data/constants.dart';
import 'package:pde/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // final _controller = TextEditingController();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _numberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _verifyPasswordController = TextEditingController();
  String _text = "0";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          color: foregroundColor,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      RichText(
                        softWrap: true,
                        textAlign: TextAlign.right,
                        text: TextSpan(
                            text: "PDE",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                color: textColor,
                                fontSize: 32),
                            children: [
                              const TextSpan(
                                  text: "\tassistant",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      color: Colors.black54,
                                      fontSize: 20)),
                              const TextSpan(
                                  text: "\npowered by MDevs Group",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      color: Colors.black54,
                                      fontSize: 8)),
                            ]),
                      ),
                    ],
                    // )
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Ro'yxatdan o'tish
                        const Text(
                          "Ro'yxatdan o'tish",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontFamily: "Roboto"),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        TextField(
                          keyboardType: TextInputType.name,
                          onChanged: (v) => setState(() {
                            // _text = v;
                          }),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "Roboto"),
                          controller: _nameController,
                          decoration: InputDecoration(
                            fillColor: inputBackgroundColor,
                            filled: true,
                            // hoverColor: inputBackgroundColor,
                            contentPadding: const EdgeInsets.all(14),
                            hintText: "Ism",
                            hintStyle: const TextStyle(
                                fontSize: 18, color: Colors.black26),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textColor),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.name,
                          onChanged: (v) => setState(() {
                            // _text = v;
                          }),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "Roboto"),
                          controller: _surnameController,
                          decoration: InputDecoration(
                            fillColor: inputBackgroundColor,
                            filled: true,
                            contentPadding: const EdgeInsets.all(14),
                            hintText: "Familiya",
                            hintStyle: const TextStyle(
                                fontSize: 18, color: Colors.black26),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textColor),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (v) => setState(() {
                            // _text = v;
                          }),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "Roboto"),
                          controller: _numberController,
                          decoration: InputDecoration(
                            fillColor: inputBackgroundColor,
                            filled: true,
                            contentPadding: const EdgeInsets.all(14),
                            hintText: "Telefon raqam",
                            hintStyle: const TextStyle(
                                fontSize: 18, color: Colors.black26),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textColor),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (v) => setState(() {
                            // _text = v;
                          }),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "Roboto"),
                          controller: _passwordController,
                          decoration: InputDecoration(
                            fillColor: inputBackgroundColor,
                            filled: true,
                            contentPadding: const EdgeInsets.all(14),
                            hintText: "Parolni kiriting",
                            hintStyle: const TextStyle(
                                fontSize: 18, color: Colors.black26),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textColor),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (v) => setState(() {
                            // _text = v;
                          }),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "Roboto"),
                          controller: _verifyPasswordController,
                          decoration: InputDecoration(
                            fillColor: inputBackgroundColor,
                            filled: true,
                            contentPadding: const EdgeInsets.all(14),
                            hintText: "Parolni tasdiqlang",
                            hintStyle: const TextStyle(
                                fontSize: 18, color: Colors.black26),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textColor),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side:
                                        const BorderSide(color: Colors.white)),
                                backgroundColor: textColor,
                              ),
                              onPressed: () async {
                                if (_nameController.text.isEmpty ||
                                    _surnameController.text.isEmpty ||
                                    _numberController.text.isEmpty ||
                                    _passwordController.text.isEmpty ||
                                    _verifyPasswordController.text.isEmpty) {
                                  showToast(
                                    "Ma'lumotlarni to'ldirib, qaytadan urinib ko'ring!",
                                    context: context,
                                    textStyle: const TextStyle(
                                        color: Colors.white, fontSize: 14),
                                    backgroundColor: Colors.red,
                                    animation:
                                        StyledToastAnimation.slideFromBottom,
                                    reverseAnimation: StyledToastAnimation.fade,
                                    position: StyledToastPosition.bottom,
                                    animDuration: const Duration(seconds: 1),
                                    duration: const Duration(seconds: 2),
                                    curve: Curves.elasticOut,
                                    reverseCurve: Curves.linear,
                                  );
                                } else {
                                  final SharedPreferences sharedPreferences =
                                      await SharedPreferences.getInstance();
                                  sharedPreferences.setString(
                                      "number", _numberController.text);
                                  sharedPreferences.setString(
                                      "password", _passwordController.text);
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const HomeScreen()));
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Ro'yxatdan o'tish".toUpperCase(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: "Roboto"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: RichText(
                      softWrap: true,
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "Allaqachon profilingiz bormi?",
                          style: const TextStyle(
                              fontFamily: "Roboto",
                              color: Colors.black45,
                              fontSize: 16),
                          children: [
                            TextSpan(
                                text: "\tKirish",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const LoginScreen()));
                                  },
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    color: textColor,
                                    fontSize: 16)),
                          ]),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
