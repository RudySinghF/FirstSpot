import 'dart:async';

import 'package:first_spot/screens/onBoardingScreen/boardingScreenModel.dart';
import 'package:first_spot/screens/signin.dart';
import 'package:first_spot/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class boardingscreen extends StatefulWidget {
  const boardingscreen({super.key});

  @override
  State<boardingscreen> createState() => _boardingscreenState();
}

class _boardingscreenState extends State<boardingscreen> {
  int currentpage = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () {
                    if (currentpage != contents.length - 1) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()));
                    }
                  },
                  child: Text(
                    currentpage == contents.length - 1 ? "" : "Skip",
                    style: TextStyle(
                      fontFamily: GoogleFonts.rubik().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ]),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentpage = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SvgPicture.asset(
                              contents[i].image,
                              height: 220,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            contents[i].title,
                            style: TextStyle(
                                fontFamily: GoogleFonts.nunito().fontFamily,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 24),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Text(
                              contents[i].desc,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: GoogleFonts.nunito().fontFamily,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.black38,
                                  fontSize: 12),
                            ),
                          )
                        ],
                      )
                    ],
                  );
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  contents.length,
                  (index) => Container(
                      height: 10,
                      width: 10,
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: currentpage == index
                              ? Color.fromARGB(255, 25, 194, 191)
                              : const Color.fromARGB(255, 222, 220, 220)))),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 50,
            width: 250,
            child: ElevatedButton(
              onPressed: () {
                if (currentpage == contents.length - 1) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const SignIn()));
                }
                _controller.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 25, 194, 191),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                currentpage == contents.length - 1 ? "Continue" : "Next",
                style: TextStyle(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
