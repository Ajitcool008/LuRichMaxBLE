import 'package:flutter/material.dart';
import 'package:lurichmaxble/authention/forgot_password.dart';
import 'package:lurichmaxble/authention/sign_up_1_view.dart';
import 'package:lurichmaxble/components/app_colors.dart';
import 'package:lurichmaxble/components/common_button.dart';
import 'package:lurichmaxble/components/input_text_field.dart';
import 'package:lurichmaxble/components/top_image_login.dart';

class CreateProfileView extends StatefulWidget {
  const CreateProfileView({super.key});

  @override
  State<CreateProfileView> createState() => _CreateProfileViewState();
}

class _CreateProfileViewState extends State<CreateProfileView> {
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Card(
          color: Color(0xffB0B0B0),
          child: Icon(Icons.arrow_back),
        ),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 80,
                backgroundImage: AssetImage("assets/icons/camera_icon.png"),
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
                    "First Name",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueGrey,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InputTextField(
                    hintText: "Enter First Name",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Last Name",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueGrey,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InputTextField(
                    hintText: "Enter Last Name",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Mobile Number",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueGrey,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InputTextField(
                    hintText: "Enter Mobile Number",
                  ),
                  SizedBox(
                    height: 10,
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
                    hintText: "Enter Email id",
                  ),
                  SizedBox(
                    height: 10,
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
                    hintText: "Enter Password",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Confirm Password",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueGrey,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InputTextField(
                    isObsecure: isConfirmPasswordVisible,
                    suffixWidget: IconButton(
                        onPressed: () {
                          setState(() {
                            isConfirmPasswordVisible =
                                !isConfirmPasswordVisible;
                          });
                        },
                        icon: isConfirmPasswordVisible
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                    hintText: "Enter Confirm Password",
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
                  buttonText: "SAVE",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPassword()),
                    );
                  },
                  buttonWidth: width * 0.91),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
