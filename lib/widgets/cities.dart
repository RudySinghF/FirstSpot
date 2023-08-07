import 'package:first_spot/firebase/Models/citymodel.dart';
import 'package:first_spot/screens/citydetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class citycontent extends StatefulWidget {
  const citycontent({super.key});

  @override
  State<citycontent> createState() => _citycontentState();
}

class _citycontentState extends State<citycontent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: city.all.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() =>
                    citydetails(city.all[index].name, city.all[index].image));
              },
              child: Container(
                // height: 200,

                width: MediaQuery.of(context).size.width * 0.4,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    image: DecorationImage(
                        opacity: 0.9,
                        image: AssetImage(city.all[index].image),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 90,
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.all(Radius.circular(16)),
                      //     image: DecorationImage(
                      //         image: AssetImage(city.all[index].image),
                      //         fit: BoxFit.cover)),
                      padding: EdgeInsets.all(1),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 42,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16)),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Colors.black])),
                      // padding: EdgeInsets.only(left: 2),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 12),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(city.all[index].name,
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.nunito().fontFamily,
                                          // fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 15)),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(city.all[index].desc,
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.nunito().fontFamily,
                                          fontWeight: FontWeight.normal,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 10))
                                ]),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          // Container(
                          //   alignment: Alignment.center,
                          //   height: 35,
                          //   width: 50,
                          //   decoration: BoxDecoration(
                          //       color: Colors.white,
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
                          //       // Text("View",
                          //       //     textAlign: TextAlign.center,
                          //       //     style: TextStyle(
                          //       //       fontFamily:
                          //       //           GoogleFonts.rubik().fontFamily,
                          //       //       fontWeight: FontWeight.bold,
                          //       //       color: Color.fromARGB(255, 21, 104, 229),
                          //       //       fontSize: 12,
                          //       //     ))
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    // Container(
                    //   height: MediaQuery.of(context).size.height * 0.25,
                    //   width: MediaQuery.of(context).size.width,
                    //   decoration: BoxDecoration(
                    //       gradient: LinearGradient(
                    //     colors: [
                    //       Vx.white,
                    //       Vx.white.withOpacity(0.4),
                    //       Colors.transparent
                    //     ],
                    //     begin: Alignment.bottomCenter,
                    //     end: Alignment.topCenter,
                    //   )),
                    // ),
                  ],
                ),
              ),
            );
          })),
    );
  }
}
