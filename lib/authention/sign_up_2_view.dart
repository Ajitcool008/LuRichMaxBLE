import 'package:flutter/material.dart';
import 'package:lurichmaxble/authention/verify_otp_view.dart';
import 'package:lurichmaxble/components/app_colors.dart';
import 'package:lurichmaxble/components/common_button.dart';
import 'package:lurichmaxble/components/input_text_field.dart';
import 'package:lurichmaxble/components/top_image_login.dart';

class SignUp2View extends StatefulWidget {
  const SignUp2View({super.key});

  @override
  State<SignUp2View> createState() => _SignUp2ViewState();
}

class _SignUp2ViewState extends State<SignUp2View> {
  bool isCheckBox = true;
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopImageLogin(
            imageHeight: height * 0.4,
            topImage: "assets/images/signup_or_servicescreen.png",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  "Signup",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("Sign Up to your account", style: TextStyle(fontSize: 14)),
                SizedBox(height: 20),
                Text(
                  "Mobile Number",
                  style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                ),
                SizedBox(height: 5),
                InputTextField(hintText: "Enter Mobile Number"),
              ],
            ),
          ),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.center,
            child: CommonButton(
              buttonTextColor: Colors.white,
              buttonColor: AppColors.appColor,
              buttonText: "SIGN IN",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VerifyOtp()),
                );
              },
              buttonWidth: width * 0.91,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Transform.scale(
                  scale: 1.3,
                  child: Checkbox(
                    activeColor: AppColors.appColor,
                    shape: CircleBorder(),
                    value: isCheckBox,
                    onChanged: (value) {
                      setState(() {
                        isCheckBox = !isCheckBox;
                      });
                    },
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'I accept the ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Terms & Conditions and Privacy Policy',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Card(
              child: CommonButton(
                buttonTextColor: AppColors.appColor,
                buttonText: "Continue as a Guest",
                onTap: () {},
                buttonWidth: width / 1.5,
                buttonColor: Colors.transparent,
              ),
            ),
          ),
          SizedBox(height: height / 9),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You Have an Account? ",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                "Sign in",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.appColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
