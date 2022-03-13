import 'package:flutter/material.dart';
import 'package:pde/screens/exportdetailed.dart';

import '../data/constants.dart';

class ExportScreen extends StatefulWidget {
  const ExportScreen({Key? key}) : super(key: key);

  @override
  State<ExportScreen> createState() => _ExportScreenState();
}

class _ExportScreenState extends State<ExportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: foregroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: textColor, //change your color here
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          "Eksport qilish",
          style: TextStyle(color: textColor),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
              itemCount: 10,
              itemBuilder: (_, index) =>
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExportDetailedScreen()));
                    },
                    child: Container(
                      child: Card(
                        elevation: 8,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Hero(
                                tag: "fruitImage",
                                child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: 0, top: 10,),
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/apple.png"),
                                          fit: BoxFit.cover),
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                      // border:
                                      // Border.all(color: textColor, width: 2)
                                  ),
                                ),
                              ),
                              SizedBox(height: 14,),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Olma".toUpperCase(),
                                      style: TextStyle(
                                          color: textColor,
                                          fontSize: 18,
                                          fontFamily: "Roboto"),
                                    ),
                                    SizedBox(height: 4,),
                                    Text(
                                      "7000 so'm/kg",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: "Roboto"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
