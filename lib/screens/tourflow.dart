import 'dart:convert';
import 'package:casa_vertical_stepper/casa_vertical_stepper.dart';
import 'package:first_spot/firebase/Authentication/user.dart';
import 'package:first_spot/firebase/Models/TourFlowModel.dart';
import 'package:first_spot/widgets/BookingAlert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:random_string/random_string.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

import '../NetworkHandler.dart';

class TourFlow extends StatefulWidget {
  final String id;
  final String packname;
  final String numdays;
  final String cost;
  final String stay;
  final String taxi;
  final String tourguide;
  final String city;
  const TourFlow(this.id, this.packname, this.numdays, this.cost, this.stay,
      this.taxi, this.tourguide, this.city);

  @override
  State<TourFlow> createState() => _TourFlowState();
}

class _TourFlowState extends State<TourFlow> {
  List<LatLng> routepoints = [];
  LatLng agra = LatLng(27.177936, 78.008444);
  LatLng mumbai = LatLng(19.072388, 72.880337);
  List<Marker> marker = [];
  User user = User(name: "", phoneNumber: "");
  String packageID = "";
  String packageName = "";
  String days = "";
  String price = "";
  String hotel = "";
  String cab = "";
  String guide = "";
  String place = "";
  String TransID = randomAlphaNumeric(10);
  int called = 0;

  NetworkHandler networkHandler = NetworkHandler();
  TourSuperModel tourSuperModel = TourSuperModel(tourdata: []);
  List<Flows> tourflows = [];
  // List<Polyline> Polylines = [
  //   Polyline(
  //       points: [LatLng(27.158086, 77.990417), LatLng(27.158350, 78.000692)],
  //       color: Colors.blueAccent,
  //       strokeWidth: 8)
  // ];

  Future<List<Flows>> getourflow() async {
    setState(() {
      packageID = widget.id;
      packageName = widget.packname;
      days = widget.numdays;
      price = widget.cost;
      hotel = widget.stay;
      cab = widget.taxi;
      guide = widget.tourguide;
      place = widget.city;
      if (place == "Agra") {
        routepoints.insert(0, agra);
      } else if (place == "Mumbai") {
        routepoints.insert(0, mumbai);
      }
      called++;
    });
    print(called);

    try {
      var userdetails = await networkHandler.get("/user/getdata");

      user = User.fromjson(userdetails["data"]);

      var response =
          await networkHandler.getquery("/package/getflow/$packageID");

      tourSuperModel = TourSuperModel.fromJson(response);
      if (called <= 1) {
        for (var item in tourSuperModel.tourdata) {
          final tourflow = Flows(
              dayname: item.dayname,
              desc: item.desc,
              start: item.start,
              end: item.end);

          tourflows.add(tourflow);
        }
      }

      return tourflows;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
              future: getourflow(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width,
                          child: FlutterMap(
                            options: MapOptions(
                                initialCenter: routepoints[0],
                                initialZoom: 9.2),
                            nonRotatedChildren: [],
                            children: [
                              TileLayer(
                                urlTemplate:
                                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                userAgentPackageName: 'com.example.app',
                              ),
                              PolylineLayer(
                                polylineCulling: false,
                                polylines: [
                                  Polyline(
                                      points: routepoints,
                                      color: Colors.blue,
                                      strokeWidth: 8)
                                ],
                              ),
                              MarkerLayer(
                                markers: marker,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            child: Text(packageName,
                                style: TextStyle(
                                    fontFamily: GoogleFonts.nunito().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 20)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.clock,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "$days Days",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily:
                                              GoogleFonts.rubik().fontFamily),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                            alignment: Alignment.topCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.currency_rupee,
                                  color: Color.fromARGB(255, 25, 194, 191),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Text(
                                    price,
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.rubik().fontFamily,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 25, 194, 191),
                                    ),
                                  ),
                                ),
                                Text("",
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.rubik().fontFamily,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 10)),
                              ],
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: (Text("Amenities",
                                style: TextStyle(
                                    fontFamily: GoogleFonts.nunito().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17))),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: (Column(
                              children: [
                                Row(
                                  children: [
                                    if (hotel == "Yes")
                                      Icon(
                                        FontAwesomeIcons.bed,
                                        size: 15,
                                      ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    if (hotel == "Yes")
                                      Text(
                                        "Twin sharing rooms",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily:
                                                GoogleFonts.rubik().fontFamily),
                                      )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    if (cab == "Yes")
                                      Icon(
                                        FontAwesomeIcons.taxi,
                                        size: 15,
                                      ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    if (cab == "Yes")
                                      Text(
                                        "Pick & Drop",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily:
                                                GoogleFonts.rubik().fontFamily),
                                      )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    if (guide == "Yes")
                                      Icon(
                                        FontAwesomeIcons.person,
                                        size: 15,
                                      ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    if (guide == "Yes")
                                      Text(
                                        "Tour guide",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily:
                                                GoogleFonts.rubik().fontFamily),
                                      )
                                  ],
                                )
                              ],
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: (Text("Tour Itinerary",
                                style: TextStyle(
                                    fontFamily: GoogleFonts.nunito().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                              alignment: Alignment.topLeft,
                              child: CasaVerticalStepperView(
                                seperatorColor: Colors.black26,
                                steps: List.generate(
                                    snapshot.data!.length,
                                    (index) => StepperStep(
                                        leading: Container(
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 25, 194, 191),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(28))),
                                        ),
                                        title: GestureDetector(
                                          onTap: () async {
                                            List<Location> start_l =
                                                await GeocodingPlatform.instance
                                                    .locationFromAddress(
                                                        snapshot.data![index]
                                                            .start);
                                            List<Location> end_l =
                                                await GeocodingPlatform.instance
                                                    .locationFromAddress(
                                                        snapshot
                                                            .data![index].end);

                                            var v1 = start_l[0].latitude;
                                            var v2 = start_l[0].longitude;
                                            var v3 = end_l[0].latitude;
                                            var v4 = end_l[0].longitude;

                                            var url = Uri.parse(
                                                'http://router.project-osrm.org/route/v1/driving/$v2,$v1;$v4,$v3?steps=true&annotations=true&geometries=geojson&overview=full');
                                            var response = await http.get(url);

                                            setState(() {
                                              routepoints = [];
                                              var router = jsonDecode(response
                                                      .body)['routes'][0]
                                                  ['geometry']['coordinates'];
                                              for (int i = 0;
                                                  i < router.length;
                                                  i++) {
                                                var rep = router[i].toString();
                                                rep = rep.replaceAll("[", "");
                                                rep = rep.replaceAll("]", "");
                                                var lat1 = rep.split(',');
                                                var long1 = rep.split(',');
                                                routepoints.add(LatLng(
                                                    double.parse(lat1[1]),
                                                    double.parse(long1[0])));
                                                print(routepoints);
                                              }
                                              marker = [
                                                Marker(
                                                    point: LatLng(v1, v2),
                                                    builder: (context) => Icon(
                                                          FontAwesomeIcons
                                                              .locationDot,
                                                          color: Colors.green,
                                                        )),
                                                Marker(
                                                    point: LatLng(v3, v4),
                                                    builder: (context) => Icon(
                                                          FontAwesomeIcons
                                                              .locationDot,
                                                          color: Colors.red,
                                                        ))
                                              ];
                                            });
                                          },
                                          child: Container(
                                            child: Text(
                                              snapshot.data![index].dayname,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily:
                                                      GoogleFonts.nunito()
                                                          .fontFamily),
                                            ),
                                          ),
                                        ),
                                        view: Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                              snapshot.data![index].desc,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily:
                                                      GoogleFonts.nunito()
                                                          .fontFamily)),
                                        ))),
                                isExpandable: true,
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: SizedBox(
                                height: 40,
                                width: 100,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 25, 194, 191),
                                        fontFamily:
                                            GoogleFonts.rubik().fontFamily,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: SizedBox(
                                height: 40,
                                width: 100,
                                child: ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) => BookingAlert(
                                              user.name,
                                              user.phoneNumber,
                                              packageName,
                                              price,
                                              TransID),
                                          barrierDismissible: true);
                                    },
                                    child: Text(
                                      "Book",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.nunito().fontFamily,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 25, 194, 191),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    );
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
        )
      ]),
    ));
  }
}
