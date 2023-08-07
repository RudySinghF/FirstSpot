import 'dart:convert';

import 'package:first_spot/screens/home.dart';
import 'package:first_spot/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:http/http.dart" as http;
import '../NetworkHandler.dart';
import '../firebase/Controller/signupcontroller.dart';
import 'Otp.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();
  final controller = Get.put(signupcontroller());
  final storage = new FlutterSecureStorage();
  NetworkHandler networkHandler = NetworkHandler();
  bool validate = false;

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
                          Form(
                              key: _formkey,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade600,
                                              spreadRadius: 0.1,
                                              blurRadius: 1)
                                        ],
                                      ),
                                      height: 50,
                                      width: 260,
                                      child: TextFormField(
                                        controller: controller.phone,
                                        // onChanged: (value) {
                                        //   value = email;
                                        // },
                                        // validator: (value) {
                                        //   if (value!.isEmpty) {
                                        //     return "  * Required";
                                        //   }
                                        //   return null;
                                        // },
                                        keyboardType: TextInputType.phone,
                                        style: TextStyle(color: Colors.black87),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            prefixIcon: Icon(Icons.phone,
                                                color: Color.fromARGB(
                                                    255, 25, 194, 191)),
                                            hintText: 'Enter Phone Number',
                                            hintStyle: TextStyle(
                                                color: Colors.black38,
                                                fontFamily: GoogleFonts.nunito()
                                                    .fontFamily,
                                                fontSize: 15)),
                                      ),
                                    ),
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
                                          onPressed: () async {
                                            if (_formkey.currentState!
                                                .validate()) {
                                              Map<String, String> data = {
                                                "phoneNumber":
                                                    controller.phone.text
                                              };
                                              var response =
                                                  await networkHandler.post(
                                                      "/user/login", data);
                                              if (response.statusCode == 200 ||
                                                  response.statusCode == 201) {
                                                Map<String, dynamic> output =
                                                    json.decode(response.body);
                                                print(output["token"]);
                                                await storage.write(
                                                    key: "token",
                                                    value: output["token"]);
                                                Get.offUntil(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Home()),
                                                    (route) => false);
                                              }
                                            }
                                          },
                                          // => movetohome(context),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromARGB(
                                                  255, 25, 194, 191),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          // child: loginload
                                          //     ? CircularProgressIndicator(
                                          //         color: Colors.white,
                                          //         strokeWidth: 2,
                                          //       )
                                          child: Text(
                                            "Sign In",
                                            style: TextStyle(
                                                fontFamily:
                                                    GoogleFonts.montserrat()
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Don't have an account ?",
                                          style: TextStyle(
                                              fontFamily: GoogleFonts.rubik()
                                                  .fontFamily,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 13),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SignUp()));
                                          },
                                          child: Text("  Sign Up",
                                              style: TextStyle(
                                                fontFamily: GoogleFonts.rubik()
                                                    .fontFamily,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                                color: Color.fromARGB(
                                                    255, 25, 194, 191),
                                              )),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ))
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
