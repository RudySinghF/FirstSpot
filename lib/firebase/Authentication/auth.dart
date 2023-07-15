import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_spot/firebase/Exceptions/exception.dart';
import 'package:first_spot/screens/Home.dart';
import 'package:first_spot/screens/onBoardingScreen/page.dart';
import 'package:first_spot/screens/splashScreen.dart';
import 'package:get/get.dart';

class Auth extends GetxController {
  static Auth get instance => Get.find();
  final _authorize = FirebaseAuth.instance;

  late final Rx<User?> fbuser;
  var verificationId = "".obs;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    fbuser = Rx<User?>(_authorize.currentUser);
    fbuser.bindStream(_authorize.userChanges());
    ever(fbuser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      Get.offAll(() => const Home());
    } else {
      Get.to(() => const splashscreen());
    }
  }

  Future<void> phoneAuthentication(String phone) async {
    await _authorize.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (credentials) async {
        await _authorize.signInWithCredential(credentials);
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'Phone number provided is not valid');
        } else {
          Get.snackbar('Error', 'Something went wrong. Please try again');
        }
      },
      timeout: const Duration(seconds: 10),
      codeSent: (verificationId, forceResendingToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _authorize.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: this.verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<void> signInWithPhone(String phone) async {
    try {
      await _authorize.signInWithPhoneNumber(phone);
      fbuser.value != null
          ? Get.offAll(() => const Home())
          : Get.to(() => const boardingscreen());
    } on FirebaseAuthException catch (e) {
      final ex = signInWithPhoneExceptions.code(e.code);
      throw ex;
    } catch (_) {
      const ex = signInWithPhoneExceptions();
      print('EXCEPTION-${ex.message}');
      throw ex;
    }
  }

  Future<void> logout() async => await _authorize.signOut();
}
