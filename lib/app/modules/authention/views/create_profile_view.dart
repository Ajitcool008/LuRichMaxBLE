import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lurichmaxble/app/modules/authention/widgets/validation_input_text_field.dart';
import 'package:lurichmaxble/app/modules/home_screen/views/home_view.dart';
import 'package:lurichmaxble/core/constants/app_colors.dart';
import 'package:lurichmaxble/app/global_widgets/common_button.dart';
import 'package:lurichmaxble/app/global_widgets/common_text_field.dart';

final _formKey = GlobalKey<FormState>();

class CreateProfileView extends StatefulWidget {
  const CreateProfileView({super.key});

  @override
  State<CreateProfileView> createState() => _CreateProfileViewState();
}

class _CreateProfileViewState extends State<CreateProfileView> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Card(color: Color(0xffB0B0B0), child: Icon(Icons.arrow_back)),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Form(
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
                    SizedBox(height: 20),
                    Text(
                      "First Name",
                      style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    ),
                    SizedBox(height: 5),
                    InputTextField(hintText: "Enter First Name"),
                    SizedBox(height: 10),
                    Text(
                      "Last Name",
                      style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    ),
                    SizedBox(height: 5),
                    InputTextField(hintText: "Enter Last Name"),
                    SizedBox(height: 10),
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
                    SizedBox(height: 10),
                    Text(
                      "Email Id",
                      style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    ),
                    SizedBox(height: 5),
                    ValidationInputTextField(
                      controller: emailController,
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
                    SizedBox(height: 10),
                    Text(
                      "Confirm Password",
                      style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    ),
                    SizedBox(height: 5),
                    ValidationInputTextField(
                      hintText: "Confirm password",
                      isObsecure: isConfirmPasswordVisible,
                      suffixWidget: IconButton(
                        onPressed: () {
                          setState(() {
                            isConfirmPasswordVisible =
                                !isConfirmPasswordVisible;
                          });
                        },
                        icon: Icon(
                          isConfirmPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: validatePassword,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: CommonButton(
                  buttonTextColor: Colors.white,
                  buttonColor: AppColors.appColor,
                  buttonText: "SAVE",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Get.offAll(HomePage());
                    }
                  },
                  buttonWidth: width * 0.91,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
