import 'package:first_spot/blank.dart';
import 'package:first_spot/screens/Navigation/BottomNavBar.dart';
import 'package:first_spot/screens/Otp.dart';
import 'package:first_spot/screens/PackageForm.dart';
import 'package:first_spot/screens/TourFlowForm.dart';
import 'package:first_spot/screens/citydetails.dart';
import 'package:first_spot/screens/home.dart';
import 'package:first_spot/screens/liveroutetractking.dart';
import 'package:first_spot/screens/onBoardingScreen/page.dart';
import 'package:first_spot/screens/signin.dart';
import 'package:first_spot/screens/signup.dart';
import 'package:first_spot/screens/splashScreen.dart';
import 'package:first_spot/screens/tourflow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'firstSpot',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => LiveTracking(),
        // myroutes.getStarted: (context) => getstarted(),
        // myroutes.loginroute: (context) => login(),
        // myroutes.homeroute: (context) => homepage(),
      },
    );
  }
}
