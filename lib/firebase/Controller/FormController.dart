import 'package:flutter/material.dart';
import 'package:get/get.dart';

class formcontroller extends GetxController {
  static formcontroller get instance => Get.find();
  final packageName = TextEditingController();
  final days = TextEditingController();
  final price = TextEditingController();
  final routename = TextEditingController();
  final desc = TextEditingController();
  final start = TextEditingController();
  final end = TextEditingController();
}
