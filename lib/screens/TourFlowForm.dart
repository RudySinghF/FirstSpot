import 'package:first_spot/screens/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../NetworkHandler.dart';
import '../firebase/Controller/FormController.dart';

class TourFlowForm extends StatefulWidget {
  final String id;
  const TourFlowForm(this.id);

  @override
  State<TourFlowForm> createState() => _TourFlowFormState();
}

class _TourFlowFormState extends State<TourFlowForm> {
  final controller = Get.put(formcontroller());
  final _formkey = GlobalKey<FormState>();
  NetworkHandler networkHandler = NetworkHandler();
  late String packageID;
  @override
  void initState() {
    print("${widget.id}");
    packageID = widget.id;
    super.initState();
  }

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
                          "C R E A T E   T O U R   F L O W",
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
                                child: Text("Route name",
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
                                  controller: controller.routename,
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
                                child: Text("Description",
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
                                  controller: controller.desc,
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
                                child: Text("Start",
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
                                  controller: controller.start,
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
                                child: Text("End",
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
                                  controller: controller.end,
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
                                onPressed: () {
                                  Get.to(() => const Home());
                                },
                                child: Text(
                                  "Submit",
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
                                    Map<String, String> tourflow = {
                                      "dayname": controller.routename.text,
                                      "desc": controller.desc.text,
                                      "start": controller.start.text,
                                      "end": controller.end.text,
                                    };
                                    await networkHandler.patch(
                                        "/package/update/$packageID", tourflow);
                                    Get.snackbar('Success', 'Route Created',
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
                                  "Add",
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
