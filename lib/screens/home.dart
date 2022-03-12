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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: textColor),
          backgroundColor: Colors.white,
          title: Center(
            child: Container(
              padding: EdgeInsets.only(right: 30),
              child: RichText(
                softWrap: true,
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "PDE",
                    style: TextStyle(
                        fontFamily: "Roboto", color: textColor, fontSize: 32),
                    children: [
                      TextSpan(
                          text: "\thelper",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              color: Colors.black54,
                              fontSize: 22)),
                    ]),
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {},
              ),
            ],
          ),
        ),
        backgroundColor: mainColor,
        body: Container(
          color: backgroundColor,
          child: Center(
            child: Text(
              "Welcome to PDE",
              style: TextStyle(
                  fontFamily: "Roboto", fontSize: 28, color: mainColor),
            ),
          ),
        ),
      ),
    );
  }
}
