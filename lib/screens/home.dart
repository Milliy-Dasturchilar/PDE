import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:pde/data/constants.dart';
import 'package:pde/screens/about.dart';
import 'package:pde/screens/delivering.dart';
import 'package:pde/screens/export.dart';
import 'package:pde/screens/packaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  SharedPreferences? preferences;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async{
      preferences = await SharedPreferences.getInstance();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: Drawer(
          backgroundColor: foregroundColor,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              Container(
                color: backgroundColor,
                height: MediaQuery.of(context).size.height/5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.account_circle, size: 80,),
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${preferences?.getString("firstName")} ${preferences?.getString("lastName")}", style: TextStyle(color: textColor, fontFamily: "Roboto", fontSize: 16),),
                        SizedBox(height: 4,),
                        Text("${preferences?.getString("number")}", style: TextStyle(color: textColor, fontFamily: "Roboto", fontSize: 16),),
                      ],
                    )
                  ],
                ),
              ),
              ListTile(
                horizontalTitleGap: 0,
                leading: Icon(Icons.add_business, color: iconColor, size: 26,),
                title: Text("Kompaniya qo'shish", style: TextStyle(color: textColor, fontSize: 16),),
                onTap: () async {
                  await launch("https://pde.pythonanywhere.com/auto-login/${preferences!.getInt("id")}/${preferences!.getString("number")}/${preferences!.getString("password")}/");
                },
              ),
              ListTile(
                horizontalTitleGap: 0,
                leading: Icon(Icons.history, color: iconColor, size: 26,),
                title: Text("Xizmatlar tarixi", style: TextStyle(color: textColor, fontSize: 16),),
                onTap: () {},
              ),
              ListTile(
                horizontalTitleGap: 0,
                leading: Icon(Icons.info_rounded, color: iconColor, size: 26,),
                title: Text("Ilova haqida", style: TextStyle(color: textColor, fontSize: 16),),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return AboutScreen();
                  }));
                },
              ),
              ListTile(
                horizontalTitleGap: 0,
                leading: Icon(Icons.question_answer, color: iconColor, size: 26,),
                title: Text("Yordam", style: TextStyle(color: textColor, fontSize: 16),),
                onTap: () {},
              ),
              ListTile(
                horizontalTitleGap: 0,
                leading: Icon(Icons.exit_to_app, color: iconColor, size: 26,),
                title: Text("Profildan chiqish", style: TextStyle(color: textColor, fontSize: 16),),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.srcOver),
                // colorFilter: ColorFilter.mode(
                //     Colors.white.withOpacity(0.2),
                //     BlendMode.srcOver),
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover),
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return PackagingScreen();
                    }));
                  },
                  child: HexagonWidget.pointy(
                    width: MediaQuery.of(context).size.width / 2.5,
                    color: Colors.white,
                    cornerRadius: 16,
                    elevation: 30,
                    child: Container(
                        padding: EdgeInsets.all(26),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/qadoqlash.png"),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Qadoqlash".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Roboto",
                                  fontSize: 14),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return DeliveringScreen();
                        }));
                      },
                      child: HexagonWidget.pointy(
                        width: MediaQuery.of(context).size.width / 2.5,
                        color: Colors.white,
                        cornerRadius: 16,
                        elevation: 30,
                        child: Container(
                          padding: EdgeInsets.all(26),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/yetkazish.png"),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Yetkazib berish".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Roboto",
                                    fontSize: 14),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          width: 80,
                          height: 80,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          softWrap: true,
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: "PDE",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  color: Colors.white,
                                  fontSize: 26),
                              children: [
                                TextSpan(
                                    text: "\tassistant",
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        color: Colors.white54,
                                        fontSize: 18)),
                                // TextSpan(
                                //     text: "Dev>",
                                //     style: TextStyle(
                                //         fontFamily: "Roboto",
                                //         color: Colors.greenAccent,
                                //         fontSize: 26)),
                              ]),
                        ),
                      ],
                    )
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ExportScreen();
                    }));
                  },
                  child: HexagonWidget.pointy(
                    width: MediaQuery.of(context).size.width / 2.5,
                    color: Colors.white,
                    cornerRadius: 16,
                    elevation: 30,
                    child: Container(
                      padding: EdgeInsets.all(26),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/eksport.png"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Eksport qilish".toUpperCase(),
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Roboto",
                                fontSize: 14),
                            textAlign: TextAlign.center,

                          )
                        ],
                      ),
                    ),
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
