import 'package:flutter/material.dart';
import 'package:pde/screens/detailed.dart';

import '../data/constants.dart';

class PackagingScreen extends StatefulWidget {
  const PackagingScreen({Key? key}) : super(key: key);

  @override
  State<PackagingScreen> createState() => _PackagingScreenState();
}

class _PackagingScreenState extends State<PackagingScreen> {
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
          "Qadoqlash xizmatlari",
          style: TextStyle(color: textColor),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, index) => Card(
                  child: Container(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 360,
                      child: Column(
                        children: [
                          Hero(
                            tag: "packCompanyImage",
                            child: Container(
                              margin:
                                  const EdgeInsets.only(bottom: 20, top: 10),
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/qadoqlash.png"),
                                      fit: BoxFit.cover),
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border:
                                      Border.all(color: textColor, width: 2)),
                            ),
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Uzum qadoqlash",
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 20,
                                    fontFamily: "Roboto"),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                "MDevs Group MCHJ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: "Roboto"),
                              )),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "990 so'm/kg",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: "Roboto"),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        side: BorderSide(
                                            color: textColor, width: 1)),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DetailedScreen(
                                                  packImage:
                                                      "assets/images/qadoqlash.png",
                                                )));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Batafsil",
                                        style: TextStyle(
                                            color: textColor,
                                            fontSize: 14,
                                            fontFamily: "Roboto"),
                                      ),
                                      Icon(
                                        Icons.chevron_right_outlined,
                                        color: textColor,
                                        size: 14,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )))),
        ),
      ),
    );
  }
}
