import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:http/http.dart';
import 'package:pde/data/constants.dart';
import 'package:pde/screens/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final _controller = TextEditingController();
  final _numberController = TextEditingController();
  final _passwordController = TextEditingController();
  String _text = "0";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          color: foregroundColor,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    SizedBox(
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
                            TextSpan(
                                text: "\tassistant",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    color: Colors.black54,
                                    fontSize: 20)),
                            TextSpan(
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
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Ro'yxatdan o'tish
                      Text(
                        "Kirish",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontFamily: "Roboto"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (v) => setState(() {
                          // _text = v;
                        }),
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "Roboto"),
                        controller: _numberController,
                        decoration: InputDecoration(
                          fillColor: inputBackgroundColor,
                          filled: true,
                          contentPadding: EdgeInsets.all(14),
                          hintText: "Telefon raqam",
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black26),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: textColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: textColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (v) => setState(() {
                          // _text = v;
                        }),
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "Roboto"),
                        controller: _passwordController,
                        decoration: InputDecoration(
                          fillColor: inputBackgroundColor,
                          filled: true,
                          contentPadding: EdgeInsets.all(14),
                          hintText: "Parolni kiriting",
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black26),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: textColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: textColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 50,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              // side: BorderSide(color: Colors.white)
                            ),
                            color: textColor,
                            onPressed: () async {
                              if (_numberController.text.isEmpty ||
                                  _passwordController.text.isEmpty) {
                                showToast(
                                  "Ma'lumotlarni to'ldirib, qaytadan urinib ko'ring!",
                                  context: context,
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                  backgroundColor: Colors.red,
                                  animation:
                                      StyledToastAnimation.slideFromBottom,
                                  reverseAnimation: StyledToastAnimation.fade,
                                  position: StyledToastPosition.bottom,
                                  animDuration: Duration(seconds: 1),
                                  duration: Duration(seconds: 2),
                                  curve: Curves.elasticOut,
                                  reverseCurve: Curves.linear,
                                );
                              } else {
                                String username = _numberController.text;
                                String password = _passwordController.text;
                                String basicAuth = 'Basic ' +
                                    base64Encode(
                                        utf8.encode('$username:$password'));
                                print(basicAuth);

                                Response r = await post(
                                    Uri.parse(
                                        "https://pde.pythonanywhere.com/api/users/check-user/"),
                                    headers: <String, String>{
                                      'Content-Type': 'application/json; charset=UTF-8',
                                      'authorization': basicAuth
                                    }, body: jsonEncode(<String, String>{
                                  'username': username,
                                  'password': password,
                                }),
                                );
                                print(r.statusCode);
                                print(r.body);
                                var jsonData = jsonDecode(r.body);
                                // print(jsonData["first_name"]);
                                // print(r.body[]);
                                if (r.statusCode == 200) {
                                  final SharedPreferences sharedPreferences =
                                      await SharedPreferences.getInstance();
                                  sharedPreferences.setInt("id", jsonData["id"]);
                                  sharedPreferences.setString("firstName", jsonData["first_name"]);
                                  sharedPreferences.setString("lastName", jsonData["last_name"]);
                                  sharedPreferences.setString(
                                      "number", _numberController.text);
                                  sharedPreferences.setString(
                                      "password", _passwordController.text);
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              HomeScreen()));
                                } else {
                                  showToast(
                                    "Telefon raqam yoki parol noto'g'ri kiritildi!\nIltimos qaytadan urinib ko'ring!",
                                    context: context,
                                    textStyle: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                    backgroundColor: Colors.red,
                                    animation:
                                        StyledToastAnimation.slideFromBottom,
                                    reverseAnimation: StyledToastAnimation.fade,
                                    position: StyledToastPosition.bottom,
                                    animDuration: Duration(seconds: 1),
                                    duration: Duration(seconds: 2),
                                    curve: Curves.elasticOut,
                                    reverseCurve: Curves.linear,
                                  );
                                }
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Kirish".toUpperCase(),
                                  style: TextStyle(
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: RichText(
                    softWrap: true,
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "Profil mavjud emasmi?",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            color: Colors.black45,
                            fontSize: 16),
                        children: [
                          TextSpan(
                              text: "\tRo'yxatdan o'tish",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              AuthScreen()));
                                },
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  color: textColor,
                                  fontSize: 16)),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
