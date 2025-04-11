import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lurichmaxble/app/modules/authention/views/forgot_password.dart';
import 'package:lurichmaxble/app/modules/authention/views/sign_up_1_view.dart';
import 'package:lurichmaxble/app/modules/authention/widgets/validation_input_text_field.dart';
import 'package:lurichmaxble/core/constants/app_colors.dart';
import 'package:lurichmaxble/app/global_widgets/common_button.dart';
import 'package:lurichmaxble/app/global_widgets/top_image_login.dart';
import 'package:lurichmaxble/app/modules/home_screen/views/home_view.dart';

final _formKey = GlobalKey<FormState>();

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopImageLogin(
              imageHeight: height * 0.4,
              topImage: "assets/images/login_screen.png",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Hi, Welcome Back!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Log in to your existing account.",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Email Id",
                      style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    ),
                    SizedBox(height: 5),
                    ValidationInputTextField(
                      controller: passwordController,
                      hintText: "Email",
                      validator: validateEmail,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Password",
                      style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    ),
                    SizedBox(height: 5),
                    ValidationInputTextField(
                      hintText: "Enter your password",
                      isObsecure: isPasswordVisible,
                      suffixWidget: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: validatePassword,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Get.to(ForgotPassword());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: AppColors.appColor),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CommonButton(
                buttonTextColor: Colors.white,
                buttonColor: AppColors.appColor,
                buttonText: "SIGN IN",
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    Get.offAll(HomePage());
                  }
                },
                buttonWidth: width * 0.91,
              ),
            ),
            SizedBox(height: 15),
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
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create a New Account? ",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(SignUp1View());
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
