import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:first_spot/Dummy/tourflowcontent.dart';
import 'package:casa_vertical_stepper/casa_vertical_stepper.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart' as imp;
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class LiveTracking extends StatefulWidget {
  const LiveTracking({super.key});

  @override
  State<LiveTracking> createState() => _LiveTrackingState();
}

class _LiveTrackingState extends State<LiveTracking> {
  List<LatLng> routepoints = [];

  List<Marker> movingMarker = [];

  List<Marker> marker = [];

  int tapped = 0;
  Location location = Location(
      latitude: 27.177936, longitude: 78.008444, timestamp: DateTime.now());

  List<String> stepp = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < tourflowpath.items.length; i++) {
      stepp.add(tourflowpath.items[i].name);
    }
  }

  Stream<Iterable<Marker>> simulateRoute() async* {
    await Future<void>.delayed(Duration(seconds: 2));
    for (int i = 0; i < routepoints.length; i++) {
      await Future<void>.delayed(Duration(seconds: 1));
      yield movingMarker = [
        Marker(
            point: LatLng(routepoints[i].latitude, routepoints[i].longitude),
            builder: (context) => Icon(
                  FontAwesomeIcons.person,
                  color: Colors.black,
                ))
      ];
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
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: FlutterMap(
                  mapController: MapController(),
                  options: MapOptions(
                      initialCenter: LatLng(27.177936, 78.008444),
                      initialZoom: 11.2),
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
                    StreamBuilder<Iterable<Marker>>(
                      stream: simulateRoute(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          if (snapshot.hasData) {
                            final mark = snapshot.data!.toList();
                            if (movingMarker
                                    .elementAt(movingMarker.length - 1) ==
                                marker.elementAt(0)) {
                              setState(() {
                                stepp.removeAt(0);
                                stepp.insert(0, "Complete");
                              });
                            }
                            return MarkerLayer(
                              markers: mark,
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(snapshot.error.toString()));
                          } else {
                            return Center(
                              child: Text("Something went wrong"),
                            );
                          }
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  child: Text("Agra Package",
                      style: TextStyle(
                          fontFamily: GoogleFonts.nunito().fontFamily,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20)),
                ),
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
                          stepp.length,
                          (index) => StepperStep(
                              leading: Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 25, 194, 191),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(28))),
                              ),
                              title: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  child: Text(
                                    stepp.elementAt(index),
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily:
                                            GoogleFonts.nunito().fontFamily),
                                  ),
                                ),
                              ),
                              view: Container(
                                alignment: Alignment.topLeft,
                                child: Text(tourflowpath.items[index].desc,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily:
                                            GoogleFonts.nunito().fontFamily)),
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
                          onPressed: () async {
                            for (int i = 0;
                                i < tourflowpath.items.length;
                                i++) {
                              List<Location> start_l = await GeocodingPlatform
                                  .instance
                                  .locationFromAddress(
                                tourflowpath.items[i].start,
                              );
                              List<Location> end_l = await GeocodingPlatform
                                  .instance
                                  .locationFromAddress(
                                      tourflowpath.items[i].end);

                              var v1 = start_l[0].latitude;
                              var v2 = start_l[0].longitude;
                              var v3 = end_l[0].latitude;
                              var v4 = end_l[0].longitude;

                              var url = Uri.parse(
                                  'http://router.project-osrm.org/route/v1/driving/$v2,$v1;$v4,$v3?steps=true&annotations=true&geometries=geojson&overview=full');
                              var response = await http.get(url);
                              setState(() {
                                var router = jsonDecode(response.body)['routes']
                                    [0]['geometry']['coordinates'];

                                for (int i = 0; i < router.length; i++) {
                                  var rep = router[i].toString();
                                  rep = rep.replaceAll("[", "");
                                  rep = rep.replaceAll("]", "");
                                  var lat1 = rep.split(',');
                                  var long1 = rep.split(',');
                                  routepoints.add(LatLng(double.parse(lat1[1]),
                                      double.parse(long1[0])));
                                  location = Location(
                                      latitude: double.parse(lat1[1]),
                                      longitude: double.parse(long1[0]),
                                      timestamp: DateTime.now());

                                  print(routepoints);
                                }
                                marker.add(Marker(
                                    point: LatLng(
                                        routepoints[routepoints.length - 1]
                                            .latitude,
                                        routepoints[routepoints.length - 1]
                                            .longitude),
                                    builder: (context) => Icon(
                                          FontAwesomeIcons.locationDot,
                                          color: Colors.red,
                                        )));
                              });
                            }
                          },
                          child: Text(
                            "Start",
                            style: TextStyle(
                              color: Color.fromARGB(255, 25, 194, 191),
                              fontFamily: GoogleFonts.rubik().fontFamily,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
