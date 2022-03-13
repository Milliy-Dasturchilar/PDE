import 'package:flutter/material.dart';
import 'package:pde/screens/orderpack.dart';

import '../data/constants.dart';

class DetailedScreen extends StatefulWidget {
  final String packImage;
  const DetailedScreen({Key? key, required this.packImage}) : super(key: key);

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
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
          "Batafsil ma'lumotlar",
          style: TextStyle(color: textColor),
        ),
      ),

      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        // color: foregroundColor,
        // width: MediaQuery.of(context).size.width,
        child: Card(
          child: Container(
            padding: EdgeInsets.only(right: 20, left: 20),
            width: MediaQuery.of(context).size.width,
          child: Column(
              children: [
                Hero(
                  tag: "packCompanyImage",
                  child: Container(
                    margin:
                    EdgeInsets.only(bottom: 20, top: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 240,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.packImage),
                            fit: BoxFit.cover),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border:
                        Border.all(color: textColor, width: 2)),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                        child: Text("Mahsulot turi: Meva", style: TextStyle(color: Colors.black, fontSize: 14),)),
                    SizedBox(height: 6),
                    Container(
                      alignment: Alignment.centerLeft,
                        child: Text("Mahsulot nomi: Uzum", style: TextStyle(color: Colors.black, fontSize: 14),)),
                    SizedBox(height: 6),
                    Container(
                      alignment: Alignment.centerLeft,
                        child: Text("Xizmat narxi: 990 so’m/kg", style: TextStyle(color: Colors.black, fontSize: 14),)),
                    SizedBox(height: 6),
                    Container(
                      alignment: Alignment.centerLeft,
                        child: Text("Qadoqlash turi: Yashik", style: TextStyle(color: Colors.black, fontSize: 14),)),
                    SizedBox(height: 6),
                    Container(
                      alignment: Alignment.centerLeft,
                        child: Text("Xizmat ko’rsatuvchi: “MDevs Group” MCHJ", style: TextStyle(color: Colors.black, fontSize: 14),)),
                    SizedBox(height: 6),
                    Container(
                      alignment: Alignment.centerLeft,
                        child: Text("Xizmat doirasi: Respublika bo’yicha", style: TextStyle(color: Colors.black, fontSize: 14),)),
                    SizedBox(height: 6),
                    Container(
                      alignment: Alignment.centerLeft,
                        child: Text("Eng kam miqdor: 100 kg", style: TextStyle(color: Colors.black, fontSize: 14),)),
                    SizedBox(height: 6),
                    Container(
                      alignment: Alignment.centerLeft,
                        child: Text("Bog’lanish: +998975555744", style: TextStyle(color: Colors.black, fontSize: 14),)),
                    SizedBox(height: 6),
                    Container(
                      alignment: Alignment.centerLeft,
                        child: Text("Manzil: Farg’ona, Al-Farg’oniy 11", style: TextStyle(color: Colors.black, fontSize: 14),)),

                  ],
                ),
                Expanded(child: Center(
                 child:
                 RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                        side: BorderSide(color: textColor, width: 1)
                    ),
                    color: textColor,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderPackageScreen(packImage: widget.packImage,)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Buyurtma berish",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: "Roboto"),
                        ),
                        Icon(Icons.chevron_right_outlined, color: Colors.white, size: 14,)
                      ],
                    ),
                  ),

                )),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
