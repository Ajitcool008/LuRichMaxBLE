import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lurichmaxble/app/modules/authention/views/verify_otp_view.dart';
import 'package:lurichmaxble/app/modules/authention/widgets/validation_input_text_field.dart';
import 'package:lurichmaxble/core/constants/app_colors.dart';
import 'package:lurichmaxble/app/global_widgets/common_button.dart';
import 'package:lurichmaxble/app/global_widgets/common_text_field.dart';
import 'package:lurichmaxble/app/global_widgets/top_image_login.dart';

import '../../home_screen/views/home_view.dart';

final _formKey = GlobalKey<FormState>();

class SignUp2View extends StatefulWidget {
  const SignUp2View({super.key});

  @override
  State<SignUp2View> createState() => _SignUp2ViewState();
}

class _SignUp2ViewState extends State<SignUp2View> {
  final TextEditingController phoneNumberController = TextEditingController();
  bool isCheckBox = true;
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
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
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sign Up to your account",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Mobile Number",
                      style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    ),
                    SizedBox(height: 5),
                    ValidationInputTextField(
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      controller: phoneNumberController,
                      validator: validatePhoneNumber,
                      hintText: "Enter Mobile Number",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: CommonButton(
                  buttonTextColor: Colors.white,
                  buttonColor: AppColors.appColor,
                  buttonText: "SIGN UP",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // If form is valid
                      Get.to(VerifyOtp());
                    }
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
                    onTap: () {
                      Get.to(HomePage());
                    },
                    buttonWidth: width / 1.5,
                    buttonColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(height: 40),
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
        ),
      ),
    );
  }
}
