import 'package:first_spot/firebase/Controller/FormController.dart';
import 'package:first_spot/screens/TourFlowForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_string/random_string.dart';
import 'package:velocity_x/velocity_x.dart';

import '../NetworkHandler.dart';

class PackageForm extends StatefulWidget {
  const PackageForm({super.key});

  @override
  State<PackageForm> createState() => _PackageFormState();
}

class _PackageFormState extends State<PackageForm> {
  final _formkey = GlobalKey<FormState>();
  final controller = Get.put(formcontroller());
  NetworkHandler networkHandler = NetworkHandler();
  final select = ["Select", "Yes", "No"];
  final selectcity = [
    "Select",
    "Agra",
    "Delhi",
    "Mumbai",
    "Bengaluru",
    "Chennai"
  ];
  String city = "Select";
  String hotel = "Select";
  String cab = "Select";
  String guide = "Select";
  String packageID = randomAlphaNumeric(15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      height: MediaQuery.of(context).size.height * 0.080,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "firstSpot",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: GoogleFonts.kiteOne().fontFamily,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              height: 1,
                              width: 80,
                              color: Colors.black38.withOpacity(0.2),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "C R E A T E   P A C K A G E",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              height: 1,
                              width: 80,
                              color: Colors.black38.withOpacity(0.2),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      // height: MediaQuery.of(context).size.height * 0.715,
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade600,
                                spreadRadius: 0.1,
                                blurRadius: 1)
                          ]),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text("Package name",
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.nunito().fontFamily,
                                      fontSize: 13,
                                      // fontWeight: FontWeight.bold
                                    )),
                                padding: EdgeInsets.symmetric(horizontal: 8),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 6,
                                        offset: Offset(0, 2))
                                  ],
                                ),
                                height: 40,
                                width: 265,
                                child: TextFormField(
                                  controller: controller.packageName,
                                  style: TextStyle(color: Colors.black87),
                                  decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      contentPadding:
                                          EdgeInsets.only(bottom: 8, left: 8),
                                      border: InputBorder.none,
                                      hintText: '',
                                      hintStyle: TextStyle(
                                          color: Colors.black38,
                                          fontFamily:
                                              GoogleFonts.nunito().fontFamily,
                                          fontSize: 15)),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text("City",
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.nunito().fontFamily,
                                      fontSize: 13,
                                      // fontWeight: FontWeight.bold
                                    )),
                                padding: EdgeInsets.symmetric(horizontal: 8),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              DropdownButton(
                                  value: city,
                                  items: selectcity
                                      .map((e) => DropdownMenuItem(
                                            child: Text(
                                              e,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily:
                                                      GoogleFonts.nunito()
                                                          .fontFamily,
                                                  fontSize: 15),
                                            ),
                                            value: e,
                                          ))
                                      .toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      city = val as String;
                                    });
                                  }),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text("Days",
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.nunito().fontFamily,
                                      fontSize: 13,
                                      // fontWeight: FontWeight.bold
                                    )),
                                padding: EdgeInsets.symmetric(horizontal: 8),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 6,
                                        offset: Offset(0, 2))
                                  ],
                                ),
                                height: 40,
                                width: 265,
                                child: TextFormField(
                                  controller: controller.days,
                                  style: TextStyle(color: Colors.black87),
                                  decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      contentPadding:
                                          EdgeInsets.only(bottom: 8, left: 8),
                                      border: InputBorder.none,
                                      hintText: '',
                                      hintStyle: TextStyle(
                                          color: Colors.black38,
                                          fontFamily:
                                              GoogleFonts.nunito().fontFamily,
                                          fontSize: 15)),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text("Cost",
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.nunito().fontFamily,
                                      fontSize: 13,
                                      // fontWeight: FontWeight.bold
                                    )),
                                padding: EdgeInsets.symmetric(horizontal: 8),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 6,
                                        offset: Offset(0, 2))
                                  ],
                                ),
                                height: 40,
                                width: 265,
                                child: TextFormField(
                                  controller: controller.price,
                                  style: TextStyle(color: Colors.black87),
                                  decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      contentPadding:
                                          EdgeInsets.only(bottom: 8, left: 8),
                                      border: InputBorder.none,
                                      hintText: '',
                                      hintStyle: TextStyle(
                                          color: Colors.black38,
                                          fontFamily:
                                              GoogleFonts.nunito().fontFamily,
                                          fontSize: 15)),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text("Hotel",
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.nunito().fontFamily,
                                      fontSize: 13,
                                      // fontWeight: FontWeight.bold
                                    )),
                                padding: EdgeInsets.symmetric(horizontal: 8),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              DropdownButton(
                                  value: hotel,
                                  items: select
                                      .map((e) => DropdownMenuItem(
                                            child: Text(
                                              e,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily:
                                                      GoogleFonts.nunito()
                                                          .fontFamily,
                                                  fontSize: 15),
                                            ),
                                            value: e,
                                          ))
                                      .toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      hotel = val as String;
                                    });
                                  }),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text("Taxi",
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.nunito().fontFamily,
                                      fontSize: 13,
                                      // fontWeight: FontWeight.bold
                                    )),
                                padding: EdgeInsets.symmetric(horizontal: 8),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              DropdownButton(
                                  value: cab,
                                  items: select
                                      .map((e) => DropdownMenuItem(
                                            child: Text(
                                              e,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily:
                                                      GoogleFonts.nunito()
                                                          .fontFamily,
                                                  fontSize: 15),
                                            ),
                                            value: e,
                                          ))
                                      .toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      cab = val as String;
                                    });
                                  }),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text("Tour guide",
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.nunito().fontFamily,
                                      fontSize: 13,
                                      // fontWeight: FontWeight.bold
                                    )),
                                padding: EdgeInsets.symmetric(horizontal: 8),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              DropdownButton(
                                  value: guide,
                                  items: select
                                      .map((e) => DropdownMenuItem(
                                            child: Text(
                                              e,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily:
                                                      GoogleFonts.nunito()
                                                          .fontFamily,
                                                  fontSize: 15),
                                            ),
                                            value: e,
                                          ))
                                      .toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      guide = val as String;
                                    });
                                  }),
                              SizedBox(
                                height: 30,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: SizedBox(
                            height: 40,
                            width: 100,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 25, 194, 191),
                                    fontFamily: GoogleFonts.rubik().fontFamily,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: SizedBox(
                            height: 40,
                            width: 100,
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (_formkey.currentState!.validate()) {
                                    Map<String, Object> data = {
                                      "packageID": packageID,
                                      "packageName":
                                          controller.packageName.text,
                                      "city": city,
                                      "days": controller.days.text,
                                      "price": controller.price.text,
                                      "hotel": hotel,
                                      "cab": cab,
                                      "guide": guide,
                                      "tourflow": []
                                    };
                                    await networkHandler.post(
                                        "/package/create", data);
                                    Get.snackbar('Success', 'Package Created',
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor:
                                            Color.fromARGB(255, 130, 216, 133)
                                                .withOpacity(0.1),
                                        colorText:
                                            Color.fromARGB(255, 22, 141, 26));
                                    Get.to(() => TourFlowForm(packageID));
                                  }
                                },
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.nunito().fontFamily,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 25, 194, 191),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
