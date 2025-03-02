import 'package:flutter/material.dart';
import 'package:lurichmaxble/authention/sign_up_2_view.dart';
import 'package:lurichmaxble/components/app_colors.dart';
import 'package:lurichmaxble/components/common_button.dart';
import 'package:lurichmaxble/components/top_image_login.dart';

class SignUp1View extends StatefulWidget {
  const SignUp1View({super.key});

  @override
  State<SignUp1View> createState() => _SignUp1ViewState();
}

class _SignUp1ViewState extends State<SignUp1View> {
  bool selectContainer1 = false;
  bool selectContainer2 = false;
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
            topImage: "assets/images/signup_or_servicescreen.png",
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
                  "I am",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectContainer1 = false;
                      selectContainer2 = true;
                    });
                  },
                  child: Container(
                    width: width / 1,
                    height: height / 7,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: selectContainer1
                            ? Color(0xffD8D8D8)
                            : Colors.blueAccent,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Service Provider",
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              "I Offer Professional Services..",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        selectContainer1
                            ? SizedBox()
                            : Image.asset("assets/icons/check_icon.png"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectContainer2 = false;
                      selectContainer1 = true;
                    });
                  },
                  child: Container(
                    width: width / 1,
                    height: height / 7,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: selectContainer2
                            ? Color(0xffD8D8D8)
                            : Colors.blueAccent,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Looking for service",
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              "I am looking for home services.",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        selectContainer2
                            ? SizedBox()
                            : Image.asset("assets/icons/check_icon.png"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: CommonButton(
                buttonTextColor: Colors.white,
                buttonColor: AppColors.appColor,
                buttonText: "SIGN UP",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignUp2View()));
                },
                buttonWidth: width * 0.91),
          ),
          SizedBox(
            height: height * 0.12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You have an Account? ",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text(
                "Sign In",
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
