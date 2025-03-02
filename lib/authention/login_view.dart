import 'package:flutter/material.dart';
import 'package:lurichmaxble/authention/sign_up_1_view.dart';
import 'package:lurichmaxble/components/app_colors.dart';
import 'package:lurichmaxble/components/common_button.dart';
import 'package:lurichmaxble/components/input_text_field.dart';
import 'package:lurichmaxble/components/top_image_login.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
            imageHeight: height / 2,
            topImage: "assets/images/login_screen.png",
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
                  "Hi, Welcome Back!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Log in to your existing account.",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
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
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueGrey,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InputTextField(
                  isObsecure: isPasswordVisible,
                  suffixWidget: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: isPasswordVisible
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off)),
                  hintText: "Enter Your Password",
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {},
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUp1View()),
                  );
                },
                buttonWidth: width * 0.91),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Card(
              child: CommonButton(
                  buttonTextColor: AppColors.appColor,
                  buttonText: "Continue as a Guest",
                  onTap: () {},
                  buttonWidth: width / 1.5,
                  buttonColor: Colors.transparent),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Create a New Account? ",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text(
                "Sign Up",
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
