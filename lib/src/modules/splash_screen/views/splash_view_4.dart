import 'package:flutter/material.dart';
import 'package:lurichmaxble/authention/login_view.dart';
import 'package:lurichmaxble/components/app_colors.dart';
import 'package:lurichmaxble/components/common_button.dart';

class SplashView4 extends StatelessWidget {
  const SplashView4({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              foregroundColor: Color(0xfff2f4ff),
              backgroundColor: Color(0xfff2f4ff),
              radius: 150,
              child: CircleAvatar(
                radius: 135,
                backgroundImage: AssetImage("assets/images/splash4.png"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              textAlign: TextAlign.center,
              "Your Convenience, \n Our Priority",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              textAlign: TextAlign.center,
              "Enjoy top-quality service at your fingertips. We \n handle the details so you can focus on what \n matters most.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xff677294),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Center(
              child: Image.asset("assets/icons/splash_dot3.png"),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            CommonButton(
              buttonTextColor: Colors.white,
              buttonColor: AppColors.appColor,
              buttonText: "Get Started",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
              buttonWidth: width / 1.9,
              buttonIcon: Icons.arrow_forward_ios_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
