import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/constants.dart';

class OrderCarScreen extends StatefulWidget {
  final String carImage;

  const OrderCarScreen({Key? key, required this.carImage}) : super(key: key);

  @override
  State<OrderCarScreen> createState() => _OrderCarScreenState();
}

class _OrderCarScreenState extends State<OrderCarScreen> {
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
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: [
              Card(
                elevation: 8,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 30, 30, 30),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Mashina turi: ISUZU",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          )),
                      const SizedBox(height: 6),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Xizmat doirasi: Respublika bo'yicha",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          )),
                      const SizedBox(height: 6),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Xizmat narxi: 50000 so’m/kun",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          )),
                      const SizedBox(height: 6),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Xizmat ko'rsatuvchi: MDevs Group",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          )),
                      const SizedBox(height: 6),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Eng kam masofa: 2 km kg",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          )),
                      const SizedBox(height: 6),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Bog’lanish: +998975555744",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          )),
                      const SizedBox(height: 6),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Manzil: Farg’ona, Al-Farg’oniy 11",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
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
                  style: const TextStyle(
                      color: Colors.black, fontSize: 18, fontFamily: "Roboto"),
                  controller: _volumeController,
                  decoration: InputDecoration(
                    fillColor: inputBackgroundColor,
                    filled: true,
                    // hoverColor: inputBackgroundColor,
                    contentPadding: const EdgeInsets.all(14),
                    hintText: "Mahsulot hajmi",
                    hintStyle:
                        const TextStyle(fontSize: 18, color: Colors.black26),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
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
                  style: const TextStyle(
                      color: Colors.black, fontSize: 18, fontFamily: "Roboto"),
                  controller: _addressController,
                  decoration: InputDecoration(
                    fillColor: inputBackgroundColor,
                    filled: true,
                    // hoverColor: inputBackgroundColor,
                    contentPadding: const EdgeInsets.all(14),
                    hintText: "Manzil",
                    hintStyle:
                        const TextStyle(fontSize: 18, color: Colors.black26),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Card(
                      elevation: 2,
                      child: TextField(
                        keyboardType: TextInputType.name,
                        onChanged: (v) => setState(() {}),
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        // focusNode: AlwaysDisabledFocusNode(),
                        onTap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2019, 1),
                              lastDate: DateTime(2022, 12),
                              builder: (context, picker) {
                                return Theme(
                                  //TODO: change colors
                                  data: ThemeData.dark().copyWith(
                                    colorScheme: ColorScheme.dark(
                                      primary: textColor,
                                      onPrimary: Colors.white,
                                      surface: Colors.white,
                                      onSurface: textColor,
                                    ),
                                    dialogBackgroundColor: foregroundColor,
                                  ),
                                  child: picker!,
                                );
                              }).then((selectedDate) {
                            if (selectedDate != null) {
                              _dateController.text =
                                  DateFormat.yMMMd().format(selectedDate);
                            }
                          });
                        },

                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "Roboto"),
                        controller: _dateController,
                        decoration: InputDecoration(
                          fillColor: inputBackgroundColor,
                          filled: true,
                          // hoverColor: inputBackgroundColor,
                          contentPadding: const EdgeInsets.all(14),
                          hintText: "Date",
                          hintStyle: const TextStyle(
                              fontSize: 18, color: Colors.black26),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const OutlineInputBorder(
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
                          TimeOfDay? pickedTime = await showTimePicker(
                            builder: (context, picker) {
                              return Theme(
                                //TODO: change colors
                                data: ThemeData.dark().copyWith(
                                  colorScheme: ColorScheme.dark(
                                    primary: textColor,
                                    onPrimary: Colors.white,
                                    surface: Colors.white,
                                    onSurface: textColor,
                                  ),
                                  dialogBackgroundColor: foregroundColor,
                                ),
                                child: picker!,
                              );
                            },
                            initialTime: TimeOfDay.now(),
                            context: context,
                          );
                          if (pickedTime != null) {
                            print(pickedTime.format(context)); //output 10:51 PM
                            DateTime parsedTime = DateFormat.jm()
                                .parse(pickedTime.format(context).toString());
                            print(parsedTime); //output 1970-01-01 22:53:00.000
                            String formattedTime =
                                DateFormat('HH:mm').format(parsedTime);
                            print(formattedTime); //output 14:59:00
                            setState(() {
                              _timeController.text =
                                  formattedTime; //set the value of text field.
                            });
                          } else {
                            print("Time is not selected");
                          }
                        },
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "Roboto"),
                        controller: _timeController,
                        decoration: InputDecoration(
                          fillColor: inputBackgroundColor,
                          filled: true,
                          // hoverColor: inputBackgroundColor,
                          contentPadding: const EdgeInsets.all(14),
                          hintText: "Time",
                          hintStyle: const TextStyle(
                              fontSize: 18, color: Colors.black26),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: 44,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Buyurtma berish",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Roboto"),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.chevron_right_outlined,
                        color: Colors.white,
                        size: 24,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
