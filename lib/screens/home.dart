import 'package:flutter/material.dart';
import 'package:pde/data/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Container(
        color: backgroundColor,
        child: Center(
          child: Text("Welcome to PDE", style: TextStyle(fontFamily: "Roboto"),),
        ),
      ),
    );
  }
}
