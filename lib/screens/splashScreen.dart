import 'dart:async';

import 'package:first_spot/screens/onBoardingScreen/page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  bool _load = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const boardingscreen())));
// 2. Future.delayed
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _load = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 64, 201, 239),
              Color.fromARGB(255, 22, 184, 181)
            ])),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 230,
              ),
              VxBox(
                child: Text(
                  "firstSpot",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: GoogleFonts.kiteOne().fontFamily,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ).box.makeCentered().expand(),
              ).make(),
              SizedBox(
                height: 10,
              ),
              // Text(
              //   "Place to excel",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 20,
              //     fontFamily: GoogleFonts.rubik().fontFamily,
              //   ),
              // ),
              SizedBox(
                height: 60,
              ),
              if (_load)
                ...[]
              else ...[
                const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
