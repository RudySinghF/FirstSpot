import 'dart:async';
import 'package:first_spot/Query/userquery.dart';
import 'package:first_spot/firebase/Authentication/auth.dart';
import 'package:first_spot/firebase/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signupcontroller extends GetxController {
  static signupcontroller get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();
  final countrycode = "+91";
  final userRepo = Get.put(AddUser());

  // void registeruser(String phone) {
  //   authentication.instance.signInUserWithPhone(phone);
  // }

  Future<void> createUser(Usermodel user) async {
    await userRepo.createUser(user);
  }

  void phoneAuthentication(String phone) {
    Auth.instance.phoneAuthentication(phone);
  }

  void userlogin(String phone) {
    Auth.instance.signInWithPhone(phone);
  }
}
