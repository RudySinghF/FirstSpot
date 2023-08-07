import 'package:first_spot/widgets/BooKingSuccess.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../NetworkHandler.dart';

class BookingAlert extends StatefulWidget {
  final String username;
  final String phone;
  final String packname;
  final String value;
  final String id;

  const BookingAlert(
      this.username, this.phone, this.packname, this.value, this.id);

  @override
  State<BookingAlert> createState() => _BookingAlertState();
}

class _BookingAlertState extends State<BookingAlert> {
  String name = "";
  String phoneNumber = "";
  String packageName = "";
  String price = "";
  String TransID = "";
  NetworkHandler networkHandler = NetworkHandler();

  @override
  void initState() {
    print("${widget.id}");
    name = widget.username;
    phoneNumber = widget.phone;
    packageName = widget.packname;
    price = widget.value;
    TransID = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Confirm",
          style: TextStyle(
            fontFamily: GoogleFonts.rubik().fontFamily,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          )),
      content: Text("Do you want to proceed ?",
          style: TextStyle(
            fontFamily: GoogleFonts.rubik().fontFamily,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          )),
      actions: [
        TextButton(
            onPressed: () async {
              Map<String, Object> data = {
                "name": name,
                "package": packageName,
                "phoneNumber": phoneNumber,
                "orderValue": price,
                "TransID": TransID,
              };
              await networkHandler.post("/order/booking", data);

              Get.to(() => BookingSuccess());
            },
            child: Text("Yes",
                style: TextStyle(
                  fontFamily: GoogleFonts.rubik().fontFamily,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 25, 194, 191),
                ))),
        TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Color.fromARGB(255, 25, 194, 191))),
            onPressed: () {},
            child: Text("No",
                style: TextStyle(
                  fontFamily: GoogleFonts.rubik().fontFamily,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ))),
      ],
    );
  }
}
