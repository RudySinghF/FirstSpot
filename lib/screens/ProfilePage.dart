import 'dart:ffi';

import 'package:first_spot/Dummy/DummyPackage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../NetworkHandler.dart';
import '../firebase/Authentication/user.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  NetworkHandler networkHandler = NetworkHandler();
  User user = User(name: "", phoneNumber: "");
  @override
  void initState() {
    setState(() {
      fetchdata();
    });
    super.initState();
  }

  void fetchdata() async {
    var response = await networkHandler.get("/user/getdata");
    setState(() {
      user = User.fromjson(response["data"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      child: Container(
                        alignment: Alignment(-0.8, 2.5),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/images/vecteezy_default-male-avatar-profile-icon-social-media-chatting_25337669.jpg"),
                          radius: 60.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(user.name,
                          style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text("Contact Info : ${user.phoneNumber}",
                          style: TextStyle(
                              fontFamily: GoogleFonts.nunito().fontFamily,
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 16)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text("Your trips",
                          style: TextStyle(
                              fontFamily: GoogleFonts.rubik().fontFamily,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  DummyPackage()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
