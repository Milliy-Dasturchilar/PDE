import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/constants.dart';

class OrderPackageScreen extends StatefulWidget {
  final String packImage;

  const OrderPackageScreen({Key? key, required this.packImage})
      : super(key: key);

  @override
  State<OrderPackageScreen> createState() => _OrderPackageScreenState();
}

class _OrderPackageScreenState extends State<OrderPackageScreen> {
  final _volumeController = TextEditingController();
  final _addressController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();

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
          "Buyurtma berish",
          style: TextStyle(color: textColor),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: [
              Card(
                elevation: 8,
                child: Container(
                  child: Row(
                    children: [
                      Hero(
                        tag: "packCompanyImage",
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom: 10, top: 10, left: 10, right: 20),
                          width: MediaQuery.of(context).size.width / 3,
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(widget.packImage),
                                  fit: BoxFit.cover),
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: textColor, width: 2)),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Uzum qadoqlash",
                            style: TextStyle(
                                color: textColor,
                                fontSize: 18,
                                fontFamily: "Roboto"),
                          ),
                          Text(
                            "MDevs Group MCHJ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "Roboto"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "990 so'm/kg",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Roboto"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Card(
                elevation: 2,
                child: TextField(
                  keyboardType: TextInputType.name,
                  onChanged: (v) => setState(() {
                    // _text = v;
                  }),
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.black, fontSize: 18, fontFamily: "Roboto"),
                  controller: _volumeController,
                  decoration: InputDecoration(
                    fillColor: inputBackgroundColor,
                    filled: true,
                    // hoverColor: inputBackgroundColor,
                    contentPadding: EdgeInsets.all(14),
                    hintText: "Mahsulot hajmi",
                    hintStyle: TextStyle(fontSize: 18, color: Colors.black26),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 2,
                child: TextField(
                  keyboardType: TextInputType.name,
                  onChanged: (v) => setState(() {
                    // _text = v;
                  }),
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.black, fontSize: 18, fontFamily: "Roboto"),
                  controller: _addressController,
                  decoration: InputDecoration(
                    fillColor: inputBackgroundColor,
                    filled: true,
                    // hoverColor: inputBackgroundColor,
                    contentPadding: EdgeInsets.all(14),
                    hintText: "Manzil",
                    hintStyle: TextStyle(fontSize: 18, color: Colors.black26),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Card(
                      elevation: 2,
                      child: TextField(
                        keyboardType: TextInputType.name,
                        onChanged: (v) => setState(() {

                        }),
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        // focusNode: AlwaysDisabledFocusNode(),
                        onTap: (){
                          FocusScope.of(context).requestFocus(new FocusNode());
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2019, 1),
                              lastDate: DateTime(2022,12),
                              builder: (context,picker){
                                return Theme(
                                  //TODO: change colors
                                  data: ThemeData.dark().copyWith(
                                    colorScheme: ColorScheme.dark(
                                      primary: textColor,
                                      onPrimary: Colors.white,
                                      surface: Colors.white,
                                      onSurface: textColor,
                                    ),
                                    dialogBackgroundColor:foregroundColor,
                                  ),
                                  child: picker!,);
                              })
                              .then((selectedDate) {
                            if(selectedDate!=null){
                              _dateController.text = DateFormat.yMMMd().format(selectedDate);
                            }
                          });
                        },

                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "Roboto"),
                        controller: _dateController,
                        decoration: InputDecoration(
                          fillColor: inputBackgroundColor,
                          filled: true,
                          // hoverColor: inputBackgroundColor,
                          contentPadding: EdgeInsets.all(14),
                          hintText: "Date",
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black26),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 2,
                      child: TextField(
                        readOnly: true,
                        keyboardType: TextInputType.name,
                        onChanged: (v) => setState(() {
                          // _text = v;
                        }),
                        onTap: () async {
                          // FocusScope.of(context).requestFocus(new FocusNode());
                          TimeOfDay? pickedTime =  await showTimePicker(
                            builder: (context, picker){
                              return Theme(
                                //TODO: change colors
                                data: ThemeData.dark().copyWith(
                                  colorScheme: ColorScheme.dark(
                                    primary: textColor,
                                    onPrimary: Colors.white,
                                    surface: Colors.white,
                                    onSurface: textColor,
                                  ),
                                  dialogBackgroundColor:foregroundColor,
                                ),
                                child: picker!,);
                            },
                            initialTime: TimeOfDay.now(),
                            context: context,
                          );
                          if(pickedTime != null ){
                            print(pickedTime.format(context));   //output 10:51 PM
                            DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                            print(parsedTime); //output 1970-01-01 22:53:00.000
                            String formattedTime = DateFormat('HH:mm').format(parsedTime);
                            print(formattedTime); //output 14:59:00
                            setState(() {
                              _timeController.text = formattedTime; //set the value of text field.
                            });
                          }else{
                            print("Time is not selected");
                          }
                        },
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "Roboto"),
                        controller: _timeController,
                        decoration: InputDecoration(
                          fillColor: inputBackgroundColor,
                          filled: true,
                          // hoverColor: inputBackgroundColor,
                          contentPadding: EdgeInsets.all(14),
                          hintText: "Time",
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black26),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width/1.4,
                  height: 44,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                        side: BorderSide(color: Colors.white, width: 1)),
                    color: textColor,
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => OrderPackageScreen(
                      //           packImage: widget.packImage,
                      //         )));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Buyurtma berish",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "Roboto"),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
