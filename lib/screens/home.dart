import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              Container(
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
                        Text("Bakhtishod Umurzakov", style: TextStyle(color: textColor, fontFamily: "Roboto", fontSize: 16),),
                        SizedBox(height: 4,),
                        Text("+998(97)8909757", style: TextStyle(color: textColor, fontFamily: "Roboto", fontSize: 16),),
                      ],
                    )
                  ],
                ),
              ),
              ListTile(
                horizontalTitleGap: 0,
                leading: const Icon(Icons.add_business),
                title: Text("Kompaniya qo'shish", style: TextStyle(color: textColor),),
                onTap: () {},
              ),
              ListTile(
                horizontalTitleGap: 0,
                leading: const Icon(Icons.history),
                title: Text("Xizmatlar tarixi", style: TextStyle(color: textColor),),
                onTap: () {},
              ),
              ListTile(
                horizontalTitleGap: 0,
                leading: const Icon(Icons.info_rounded),
                title: Text("Ilova haqida", style: TextStyle(color: textColor),),
                onTap: () {},
              ),
              ListTile(
                horizontalTitleGap: 0,
                leading: const Icon(Icons.question_answer),
                title: Text("Yordam", style: TextStyle(color: textColor),),
                onTap: () {},
              ),
              ListTile(
                horizontalTitleGap: 0,
                leading: const Icon(Icons.exit_to_app),
                title: Text("Profildan chiqish", style: TextStyle(color: textColor),),
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
                HexagonWidget.pointy(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HexagonWidget.pointy(
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
                                    text: "\thelper",
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
                HexagonWidget.pointy(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
