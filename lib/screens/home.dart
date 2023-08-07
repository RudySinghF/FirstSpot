import 'package:first_spot/NetworkHandler.dart';
import 'package:first_spot/firebase/Authentication/User.dart';
import 'package:first_spot/widgets/cities.dart';
import 'package:first_spot/widgets/popularcities.dart';
import 'package:first_spot/widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int currentindex;
  NetworkHandler networkHandler = NetworkHandler();
  User user = User(name: "", phoneNumber: "");
  @override
  void initState() {
    currentindex = 0;
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
      physics: const BouncingScrollPhysics(),
      child: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Where do",
                            style: TextStyle(
                                fontFamily: GoogleFonts.montserrat().fontFamily,
                                color: Color(0xFF29303D).withOpacity(0.6),
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "want to go?",
                            style: TextStyle(
                                fontFamily: GoogleFonts.montserrat().fontFamily,
                                color: Color(0xFF29303D),
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: CircleAvatar(
                      backgroundColor: Color(0xffffdbc9),
                      radius: 26,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              searchbar(),
              SizedBox(
                height: 36,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Explore",
                    style: TextStyle(
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        color: Color(0xFF29303D),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 16, right: 8),
                          child: GestureDetector(
                            child: Text(
                              "All",
                              style: TextStyle(
                                  fontFamily: GoogleFonts.nunito().fontFamily,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              setState(() {
                                currentindex = 1;
                              });
                            },
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          child: Text(
                            "Popular",
                            style: TextStyle(
                                fontFamily: GoogleFonts.nunito().fontFamily,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            setState(() {
                              currentindex = 2;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                            child: Text(
                              "Recommended",
                              style: TextStyle(
                                  fontFamily: GoogleFonts.nunito().fontFamily,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              setState(() {
                                currentindex = 3;
                              });
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                            child: Text(
                              "Most Liked",
                              style: TextStyle(
                                  fontFamily: GoogleFonts.nunito().fontFamily,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              setState(() {
                                currentindex = 4;
                              });
                            }),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              currentindex == 0
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: const citycontent(),
                    )
                  : SizedBox(
                      height: 0,
                    ),
              currentindex == 1
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: const citycontent(),
                    )
                  : SizedBox(
                      height: 0,
                    ),
              currentindex == 2
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: const popularcities(),
                    )
                  : SizedBox(
                      height: 0,
                    ),
              currentindex == 3
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: const citycontent(),
                    )
                  : SizedBox(
                      height: 0,
                    ),
              currentindex == 4
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: const popularcities(),
                    )
                  : SizedBox(
                      height: 0,
                    ),
            ],
          ),
        )
      ]),
    ));
  }
}
