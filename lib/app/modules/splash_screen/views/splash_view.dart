import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lurichmaxble/app/modules/home_screen/views/home_view.dart';
import 'package:lurichmaxble/app/modules/splash_screen/views/splash_view_2.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  var box = GetStorage();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      bool isLoggedIn = box.read('isLoggedIN') ?? false;

      if (isLoggedIn) {
        Get.off(HomePage());
      } else {
        Future.delayed(Duration(seconds: 3), () {
          Get.off(SplashView2());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SizedBox(
        height: height / 1,
        width: width / 1,
        child: Image.asset(
          "assets/images/splash_screen1.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
