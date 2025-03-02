import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:lurichmaxble/authention/create_profile_view.dart';
import 'package:lurichmaxble/components/app_colors.dart';
import 'package:lurichmaxble/components/common_button.dart';
import 'package:lurichmaxble/components/input_text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Card(
          child: Icon(Icons.arrow_back),
        ),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Center(
              child: Image.asset("assets/icons/forgot_passwrod_icons.png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Password link will be send your register email \n address,",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Email Id",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueGrey,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InputTextField(
                    hintText: "Enter Your Email",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Align(
              alignment: Alignment.center,
              child: CommonButton(
                  buttonTextColor: Colors.white,
                  buttonColor: AppColors.appColor,
                  buttonText: "SEND",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateProfileView()),
                    );
                  },
                  buttonWidth: width * 0.91),
            ),
          ],
        ),
      ),
    );
  }
}
