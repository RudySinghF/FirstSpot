import 'package:first_spot/firebase/Authentication/auth.dart';
import 'package:first_spot/screens/Home.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  static OtpController get instance => Get.find();

  Future<void> verifyOTP(String otp) async {
    var isVerified = await Auth.instance.verifyOTP(otp);
    isVerified ? Get.offAll(() => const Home()) : Get.back();
  }
}
