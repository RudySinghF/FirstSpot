import 'package:first_spot/screens/liveroutetractking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DummyPackage extends StatefulWidget {
  const DummyPackage({super.key});

  @override
  State<DummyPackage> createState() => _DummyPackageState();
}

class _DummyPackageState extends State<DummyPackage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 1,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                height: 112,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade600,
                        spreadRadius: 0.1,
                        blurRadius: 1)
                  ],
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(6),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/taj.jpg"),
                                  fit: BoxFit.cover)),
                          // padding: EdgeInsets.all(1),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 112,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 5),
                          child: Row(
                            children: [
                              Container(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Agra Package",
                                          style: TextStyle(
                                              fontFamily: GoogleFonts.rubik()
                                                  .fontFamily,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 17)),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      // Text("Fatehabad Road, Agra",
                                      //     style: TextStyle(
                                      //         fontFamily: GoogleFonts.rubik()
                                      //             .fontFamily,
                                      //         fontWeight: FontWeight.normal,
                                      //         color: Colors.black,
                                      //         fontSize: 10)),
                                      Row(
                                        children: [
                                          Container(
                                              height: 4,
                                              width: 4,
                                              child: Icon(
                                                Icons.hotel,
                                                size: 20,
                                              )),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Container(
                                              height: 4,
                                              width: 4,
                                              child: Icon(
                                                Icons.local_taxi,
                                                size: 20,
                                              )),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Container(
                                              height: 4,
                                              width: 4,
                                              child: Icon(
                                                Icons.person,
                                                size: 20,
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.currency_rupee,
                                            color: Color.fromARGB(
                                                255, 25, 194, 191),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 8),
                                            child: Text(
                                              "700",
                                              style: TextStyle(
                                                fontFamily: GoogleFonts.rubik()
                                                    .fontFamily,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 25, 194, 191),
                                              ),
                                            ),
                                          ),
                                          // Text("per day",
                                          //     style: TextStyle(
                                          //         fontFamily:
                                          //             GoogleFonts.rubik()
                                          //                 .fontFamily,
                                          //         fontWeight: FontWeight.normal,
                                          //         color: Colors.black,
                                          //         fontSize: 10)),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 7),
                                            child: SizedBox(
                                              height: 35,
                                              width: 70,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    Get.to(
                                                        () => LiveTracking());
                                                  },
                                                  child: Text(
                                                    "View",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          GoogleFonts.rubik()
                                                              .fontFamily,
                                                    ),
                                                  ),
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          Color.fromARGB(255,
                                                              25, 194, 191),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)))),
                                            ),
                                          )
                                        ],
                                      ),
                                    ]),
                              ),
                              // SizedBox(
                              //   width: 30,
                              // ),
                              // Container(
                              //   alignment: Alignment.center,
                              //   height: 35,
                              //   width: 50,
                              //   decoration: BoxDecoration(
                              //       color: Color.fromARGB(255, 255, 255, 255),
                              //       borderRadius:
                              //           BorderRadius.all(Radius.circular(8)),
                              //       boxShadow: [
                              //         BoxShadow(
                              //             color: Colors.grey.shade600,
                              //             spreadRadius: 0.1,
                              //             blurRadius: 1)
                              //       ]),
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       SizedBox(
                              //         height: 10,
                              //       ),
                              //       Text("View",
                              //           textAlign: TextAlign.center,
                              //           style: TextStyle(
                              //             fontFamily:
                              //                 GoogleFonts.rubik().fontFamily,
                              //             fontWeight: FontWeight.bold,
                              //             color:
                              //                 Color.fromARGB(255, 21, 104, 229),
                              //             fontSize: 12,
                              //           ))
                              //     ],
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          })),
    );
  }
}
