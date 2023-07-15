import 'package:first_spot/firebase/Controller/otpcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

var optcontroller = Get.put(OtpController());
var otpc;

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage(
                            "assets/images/pexels-vincent-rivaud-2265876.jpg"))),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "firstSpot",
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: GoogleFonts.kiteOne().fontFamily,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Column(children: [
                                  Text("Enter the verification code",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                          fontSize: 13,
                                          fontFamily:
                                              GoogleFonts.manrope().fontFamily,
                                          fontWeight: FontWeight.normal)),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  OtpTextField(
                                    numberOfFields: 6,
                                    fillColor: Colors.white,
                                    filled: true,
                                    showFieldAsBox: true,
                                    enabledBorderColor: Colors.grey.shade600,
                                    borderWidth: 1,
                                    onSubmit: (code) {
                                      otpc = code;
                                      OtpController.instance.verifyOTP(otpc);
                                    },
                                  ),
                                ]),
                                SizedBox(
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: SizedBox(
                                    height: 50,
                                    width: 150,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        OtpController.instance.verifyOTP(otpc);
                                      },
                                      // => movetohome(context),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromARGB(255, 25, 194, 191),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      // child: loginload
                                      //     ? CircularProgressIndicator(
                                      //         color: Colors.white,
                                      //         strokeWidth: 2,
                                      //       )
                                      child: Text(
                                        "Verify",
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.montserrat()
                                                .fontFamily,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
