import 'package:first_spot/NetworkHandler.dart';
import 'package:first_spot/firebase/Models/user.dart';
import 'package:first_spot/screens/Otp.dart';
import 'package:first_spot/screens/home.dart';
import 'package:first_spot/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_string/random_string.dart';
import '../firebase/Controller/signupcontroller.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  final controller = Get.put(signupcontroller());
  String userid = randomAlphaNumeric(10);
  NetworkHandler networkHandler = NetworkHandler();
  bool validate = false;

  checkuser() async {
    if (controller.phone.text.length == 0) {
      setState(() {
        validate = false;
      });
    } else {
      var response =
          await networkHandler.get("/user/checkuser/${controller.phone.text}");
      if (response != null) {
        setState(() {
          validate = false;
        });
      } else {
        setState(() {
          validate = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage(
                            "assets/images/pexels-vincent-rivaud-2265876.jpg"))),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "firstSpot",
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: GoogleFonts.kiteOne().fontFamily,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Form(
                              key: _formkey,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade600,
                                              spreadRadius: 0.1,
                                              blurRadius: 1)
                                        ],
                                      ),
                                      height: 50,
                                      width: 260,
                                      child: TextFormField(
                                        controller: controller.name,
                                        // onChanged: (value) {
                                        //   value = email;
                                        // },
                                        // validator: (value) {
                                        //   if (value!.isEmpty) {
                                        //     return "  * Required";
                                        //   }
                                        //   return null;
                                        // },
                                        keyboardType: TextInputType.name,
                                        style: TextStyle(color: Colors.black87),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            prefixIcon: const Icon(
                                                Icons.person_2_rounded,
                                                color: Color.fromARGB(
                                                    255, 25, 194, 191)),
                                            hintText: 'Enter Name',
                                            hintStyle: TextStyle(
                                                color: Colors.black38,
                                                fontFamily: GoogleFonts.nunito()
                                                    .fontFamily,
                                                fontSize: 15)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade600,
                                              spreadRadius: 0.1,
                                              blurRadius: 1)
                                        ],
                                      ),
                                      height: 50,
                                      width: 260,
                                      child: TextFormField(
                                        controller: controller.phone,
                                        // onChanged: (value) {
                                        //   value = email;
                                        // },
                                        // validator: (value) {
                                        //   if (value!.isEmpty) {
                                        //     return "  * Required";
                                        //   }
                                        //   return null;
                                        // },
                                        keyboardType: TextInputType.phone,
                                        style: TextStyle(color: Colors.black87),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            prefixIcon: Icon(Icons.phone,
                                                color: Color.fromARGB(
                                                    255, 25, 194, 191)),
                                            hintText: 'Enter Phone Number',
                                            hintStyle: TextStyle(
                                                color: Colors.black38,
                                                fontFamily: GoogleFonts.nunito()
                                                    .fontFamily,
                                                fontSize: 15)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: SizedBox(
                                        height: 50,
                                        width: 150,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            await checkuser();
                                            if (_formkey.currentState!
                                                    .validate() &&
                                                validate) {
                                              Map<String, String> data = {
                                                "name": controller.name.text,
                                                "phoneNumber":
                                                    controller.phone.text
                                              };
                                              await networkHandler.post(
                                                  "/user/register", data);
                                              Get.snackbar('Success',
                                                  'Your account is created',
                                                  snackPosition:
                                                      SnackPosition.BOTTOM,
                                                  backgroundColor:
                                                      Color.fromARGB(255, 130,
                                                              216, 133)
                                                          .withOpacity(0.1),
                                                  colorText: Color.fromARGB(
                                                      255, 22, 141, 26));
                                              // final user = Usermodel(
                                              //   id: userid,
                                              //   // name: controller.name.text,
                                              //   phone: controller.phone.text
                                              //       .trim(),
                                              // );
                                              // signupcontroller.instance
                                              //     .createUser(user);
                                              // signupcontroller.instance
                                              //     .phoneAuthentication(
                                              //         controller.countrycode +
                                              //             controller.phone.text
                                              //                 .trim());
                                              Get.to(() => const Home());
                                            } else {
                                              Get.snackbar('Failed',
                                                  'Something went wrong',
                                                  snackPosition:
                                                      SnackPosition.BOTTOM,
                                                  backgroundColor:
                                                      Color.fromARGB(255, 244,
                                                              121, 113)
                                                          .withOpacity(0.1),
                                                  colorText: Color.fromARGB(
                                                      255, 164, 23, 23));
                                            }
                                          },
                                          // => movetohome(context),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromARGB(
                                                  255, 25, 194, 191),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          // child: loginload
                                          //     ? CircularProgressIndicator(
                                          //         color: Colors.white,
                                          //         strokeWidth: 2,
                                          //       )
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                                fontFamily:
                                                    GoogleFonts.montserrat()
                                                        .fontFamily,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Already have an account ?",
                                          style: TextStyle(
                                              fontFamily: GoogleFonts.rubik()
                                                  .fontFamily,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 13),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SignIn()));
                                          },
                                          child: Text("  Sign in",
                                              style: TextStyle(
                                                fontFamily: GoogleFonts.rubik()
                                                    .fontFamily,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                                color: Color.fromARGB(
                                                    255, 25, 194, 191),
                                              )),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
