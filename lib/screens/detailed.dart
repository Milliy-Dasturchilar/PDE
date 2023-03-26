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
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        // color: foregroundColor,
        // width: MediaQuery.of(context).size.width,
        child: Card(
          child: Container(
            padding: const EdgeInsets.only(right: 20, left: 20),
            width: MediaQuery.of(context).size.width,
          child: Column(
              children: [
                Hero(
                  tag: "packCompanyImage",
                  child: Container(
                    margin:
                    const EdgeInsets.only(bottom: 20, top: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 240,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.packImage),
                            fit: BoxFit.cover),
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border:
                        Border.all(color: textColor, width: 2)),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                        child: const Text("Mahsulot turi: Meva", style: TextStyle(color: Colors.black, fontSize: 14),)),
                    const SizedBox(height: 6),
                    Container(
                      alignment: Alignment.centerLeft,
                        child: const Text("Mahsulot nomi: Uzum", style: TextStyle(color: Colors.black, fontSize: 14),)),
                    const SizedBox(height: 6),
                    Container(
                      alignment: Alignment.centerLeft,
                        child: const Text("Xizmat narxi: 990 so’m/kg", style: TextStyle(color: Colors.black, fontSize: 14),)),
                    const SizedBox(height: 6),
                    Container(
                      alignment: Alignment.centerLeft,
                        child: const Text("Qadoqlash turi: Yashik", style: TextStyle(color: Colors.black, fontSize: 14),)),
                    const SizedBox(height: 6),
                    Container(
                      alignment: Alignment.centerLeft,
                        child: const Text("Xizmat ko’rsatuvchi: “MDevs Group” MCHJ", style: TextStyle(color: Colors.black, fontSize: 14),)),
                    const SizedBox(height: 6),
                    Container(
                      alignment: Alignment.centerLeft,
                        child: const Text("Xizmat doirasi: Respublika bo’yicha", style: TextStyle(color: Colors.black, fontSize: 14),)),
                    const SizedBox(height: 6),
                    Container(
                      alignment: Alignment.centerLeft,
                        child: const Text("Eng kam miqdor: 100 kg", style: TextStyle(color: Colors.black, fontSize: 14),)),
                    const SizedBox(height: 6),
                    Container(
                      alignment: Alignment.centerLeft,
                        child: const Text("Bog’lanish: +998975555744", style: TextStyle(color: Colors.black, fontSize: 14),)),
                    const SizedBox(height: 6),
                    Container(
                      alignment: Alignment.centerLeft,
                        child: const Text("Manzil: Farg’ona, Al-Farg’oniy 11", style: TextStyle(color: Colors.black, fontSize: 14),)),

                  ],
                ),
                Expanded(child: Center(
                 child:
                 ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          side: BorderSide(color: textColor, width: 1)
                      ), backgroundColor: textColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderPackageScreen(packImage: widget.packImage,)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
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
