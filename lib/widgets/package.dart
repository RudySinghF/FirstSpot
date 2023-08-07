import 'package:first_spot/firebase/Models/SuperModel.dart';
import 'package:first_spot/screens/tourflow.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../NetworkHandler.dart';

class CityPackage extends StatefulWidget {
  final String city;
  final String image;

  const CityPackage(this.city, this.image);

  @override
  State<CityPackage> createState() => _CityPackageState();
}

class _CityPackageState extends State<CityPackage> {
  NetworkHandler networkHandler = NetworkHandler();
  SuperModel superModel = SuperModel(data: []);
  List<Package> packages = [];
  String place = "";
  String placeImage = "";
  int called = 0;

  // int? count;
  Future<List<Package>> getAllPackage() async {
    setState(() {
      place = widget.city;
      placeImage = widget.image;
      called++;
    });

    try {
      var response = await networkHandler.getquery("/package/getall/$place");

      superModel = SuperModel.fromJson(response);
      if (called <= 1) {
        for (var item in superModel.data) {
          final package = Package(
              packageID: item.packageID,
              packageName: item.packageName,
              city: item.city,
              days: item.days,
              price: item.price,
              hotel: item.hotel,
              cab: item.cab,
              guide: item.guide);
          packages.add(package);
        }
      }
      return packages;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder<List<Package>>(
          future: getAllPackage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          snapshot.data![index].packageID;
                        },
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                        image: DecorationImage(
                                            image: AssetImage(placeImage),
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
                                                Text(
                                                    snapshot.data![index]
                                                        .packageName,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            GoogleFonts.rubik()
                                                                .fontFamily,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                    if (snapshot.data![index]
                                                            .hotel ==
                                                        "Yes")
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
                                                    if (snapshot
                                                            .data![index].cab ==
                                                        "Yes")
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
                                                    if (snapshot.data![index]
                                                            .guide ==
                                                        "Yes")
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Icon(
                                                      Icons.currency_rupee,
                                                      color: Color.fromARGB(
                                                          255, 25, 194, 191),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 8),
                                                      child: Text(
                                                        snapshot
                                                            .data![index].price,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              GoogleFonts
                                                                      .rubik()
                                                                  .fontFamily,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255,
                                                              25,
                                                              194,
                                                              191),
                                                        ),
                                                      ),
                                                    ),
                                                    Text("",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                GoogleFonts
                                                                        .rubik()
                                                                    .fontFamily,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color: Colors.black,
                                                            fontSize: 10)),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 7),
                                                      child: SizedBox(
                                                        height: 35,
                                                        width: 70,
                                                        child: ElevatedButton(
                                                            onPressed: () {
                                                              Get.to(() => TourFlow(
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .packageID,
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .packageName,
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .days,
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .price,
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .hotel,
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .cab,
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .guide,
                                                                  place));
                                                            },
                                                            child: Text(
                                                              "View",
                                                              style: TextStyle(
                                                                fontFamily: GoogleFonts
                                                                        .rubik()
                                                                    .fontFamily,
                                                              ),
                                                            ),
                                                            style: ElevatedButton.styleFrom(
                                                                backgroundColor:
                                                                    Color.fromARGB(
                                                                        255,
                                                                        25,
                                                                        194,
                                                                        191),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
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
                    }));
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return Center(
                  child: Text("Something went wrong"),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
