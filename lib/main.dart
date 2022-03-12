import 'package:flutter/material.dart';
import 'package:pde/data/constants.dart';
import 'package:pde/screens/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "PDE",
    theme: ThemeData(primarySwatch: Colors.blue),
    home: HomeScreen(),
  ));
}