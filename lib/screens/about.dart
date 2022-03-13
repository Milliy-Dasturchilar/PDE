import 'package:flutter/material.dart';
import 'package:pde/data/constants.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
          "Ilova haqida",
          style: TextStyle(color: textColor),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 160,
              height: 160,
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
                      fontFamily: "Roboto", color: textColor, fontSize: 26),
                  children: [
                    TextSpan(
                        text: "\tassistant",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            color: Colors.black54,
                            fontSize: 18)),
                    // TextSpan(
                    //     text: "Dev>",
                    //     style: TextStyle(
                    //         fontFamily: "Roboto",
                    //         color: Colors.greenAccent,
                    //         fontSize: 26)),
                  ]),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "         There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
              style: TextStyle(color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}
