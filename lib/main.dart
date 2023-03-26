import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pde/screens/splash.dart';

void main() async {
  String username = 'pde';
  String password = 'pde.admin';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  print(basicAuth);

  Response r = await get(Uri.parse("https://pde.pythonanywhere.com/api/"),
      headers: <String, String>{'authorization': basicAuth});
  print(r.statusCode);
  print(r.body);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "PDE",
    theme: ThemeData(primarySwatch: Colors.blue),
    home: const SplashScreen(),
  ));
}
