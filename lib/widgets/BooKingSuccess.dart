import 'package:first_spot/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingSuccess extends StatefulWidget {
  const BookingSuccess({super.key});

  @override
  State<BookingSuccess> createState() => _BookingSuccessState();
}

class _BookingSuccessState extends State<BookingSuccess> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Success",
          style: TextStyle(
            fontFamily: GoogleFonts.rubik().fontFamily,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          )),
      actions: [
        TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Color.fromARGB(255, 25, 194, 191))),
            onPressed: () {
              Get.to(() => Home());
            },
            child: Text("OK",
                style: TextStyle(
                  fontFamily: GoogleFonts.rubik().fontFamily,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ))),
      ],
    );
  }
}
