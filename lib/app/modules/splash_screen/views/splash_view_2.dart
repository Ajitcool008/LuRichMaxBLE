import 'package:flutter/material.dart';
import 'package:lurichmaxble/app/modules/authention/views/login_view.dart';
import 'package:lurichmaxble/app/modules/splash_screen/views/splash_view_3.dart';

class SplashView2 extends StatelessWidget {
  const SplashView2({super.key});

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
              // backgroundImage: AssetImage("assets/images/splash2.png"),
              radius: 150,
              child: CircleAvatar(
                radius: 135,
                backgroundImage: AssetImage("assets/images/splash2.png"),
              ),
            ),
            SizedBox(height: 20),
            Text(
              textAlign: TextAlign.center,
              "Everything You \n Need, On-Demand",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              textAlign: TextAlign.center,
              "Get instant access to top-rated services at \n your fingertips. Whether you need a ride, food \n delivery, or home services, we’ve got you \n covered—fast, reliable, and hassle-free!",
              style: TextStyle(
                fontSize: 14,
                // fontWeight: FontWeight.bold,
                color: Color(0xff677294),
              ),
            ),
            SizedBox(height: height * 0.05),
            Center(child: Image.asset("assets/icons/splash_dot1.png")),
            SizedBox(height: height * 0.15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginView()),
                      );
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Color(0xff283891)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SplashView3()),
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
