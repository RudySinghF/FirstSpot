import 'package:first_spot/widgets/package.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class citydetails extends StatefulWidget {
  final String city;
  final String image;
  const citydetails(this.city, this.image);

  @override
  State<citydetails> createState() => _citydetailsState();
}

class _citydetailsState extends State<citydetails> {
  String place = "";
  String placeImage = "";

  @override
  void initState() {
    place = widget.city;
    placeImage = widget.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.500,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade600,
                        spreadRadius: 0.5,
                        blurRadius: 5)
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(placeImage))),
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  height: MediaQuery.of(context).size.height * 0.460,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            // padding: const EdgeInsets.only(left: 16),
                            alignment: Alignment.topCenter,
                            child: Text(
                              place,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: GoogleFonts.nunito().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                            // padding: const EdgeInsets.only(left: 16),
                            alignment: Alignment.topCenter,
                            child: Text(
                              "India",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: GoogleFonts.nunito().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                            ),
                          )
                        ],
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
                            "S E L E C T   P A C K A G E",
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
                      CityPackage(place, placeImage)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
