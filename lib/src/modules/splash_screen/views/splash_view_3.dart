import 'package:flutter/material.dart';
import 'package:lurichmaxble/authention/sign_up_1_view.dart';

import 'splash_view_4.dart';

class SplashView3 extends StatelessWidget {
  const SplashView3({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
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
                backgroundImage: AssetImage("assets/images/splash3.png"),
              ),
            ),
            SizedBox(height: 20),
            Text(
              textAlign: TextAlign.center,
              "Easy, Fast & \n Secure",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              textAlign: TextAlign.center,
              "Book in seconds, track in real-time, and pay \n securely. Our seamless process ensures a \n hassle-free experience every time.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xff677294),
              ),
            ),
            SizedBox(height: height * 0.05),
            Center(child: Image.asset("assets/icons/splash_dot2.png")),
            SizedBox(height: height * 0.15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUp1View()),
                      );
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Color(0xff283891)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SplashView4(),
                        ),
                      );
                    },
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff283891),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
