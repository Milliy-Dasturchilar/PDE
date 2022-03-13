import 'package:flutter/material.dart';
import 'package:pde/screens/ordercar.dart';

import '../data/constants.dart';

class DeliveringScreen extends StatefulWidget {
  const DeliveringScreen({Key? key}) : super(key: key);

  @override
  State<DeliveringScreen> createState() => _DeliveringScreenState();
}

class _DeliveringScreenState extends State<DeliveringScreen> {
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
          "Yetkazib berish xizmatlari",
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
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, index) =>
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderCarScreen(carImage: "assets/images/yetkazish.png",)));

                    },
                    child: Container(
                      child: Card(
                        elevation: 8,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Isuzu".toUpperCase(),
                                      style: TextStyle(
                                          color: textColor,
                                          fontSize: 22,
                                          fontFamily: "Roboto"),
                                    ),
                                    Text(
                                      "Toshkent",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: "Roboto"),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "50000 so'm/kun",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: "Roboto"),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 30,),
                              Hero(
                                tag: "packCarImage",
                                child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: 10, top: 10, right: 10),
                                  width: MediaQuery.of(context).size.width / 3,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/yetkazish.png"),
                                          fit: BoxFit.cover),
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border:
                                          Border.all(color: textColor, width: 2)),
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
