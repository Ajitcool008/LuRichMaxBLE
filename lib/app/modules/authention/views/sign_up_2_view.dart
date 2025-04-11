import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lurichmaxble/app/modules/authention/views/sign_in_view.dart';
import 'package:lurichmaxble/app/modules/authention/views/verify_otp_view.dart';
import 'package:lurichmaxble/app/modules/authention/widgets/validation_input_text_field.dart';
import 'package:lurichmaxble/core/constants/app_colors.dart';
import 'package:lurichmaxble/app/global_widgets/common_button.dart';
import 'package:lurichmaxble/app/global_widgets/top_image_login.dart';

import '../../home_screen/views/home_view.dart';
import 'package:country_picker/country_picker.dart';

final _formKey = GlobalKey<FormState>();

class SignUp2View extends StatefulWidget {
  const SignUp2View({super.key});

  @override
  State<SignUp2View> createState() => _SignUp2ViewState();
}

class _SignUp2ViewState extends State<SignUp2View> {
  Country _selectedCountry = Country(
    fullExampleWithPlusSign: "+",
    phoneCode: '1',
    countryCode: 'US',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'United States',
    example: '2015550123',
    displayName: 'United States',
    displayNameNoCountryCode: 'United States',
    e164Key: '',
  );

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
  }

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
                    const Text("Mobile Number", style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              showPhoneCode: true,
                              onSelect: (Country country) {
                                setState(() {
                                  _selectedCountry = country;
                                });
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Row(
                              children: [
                                Text(_selectedCountry.flagEmoji),
                                const SizedBox(width: 4),
                                Text('+${_selectedCountry.phoneCode}'),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ValidationInputTextField(
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            controller: phoneNumberController,
                            validator: validatePhoneNumber,
                            hintText: "Enter Mobile Number",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
                      Get.to(
                        VerifyOtp(),
                        arguments: {
                          "phoneNumber": phoneNumberController.text,
                          "countryCode": _selectedCountry.phoneCode,
                        },
                      );
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
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SigninView());
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.appColor,
                      ),
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
