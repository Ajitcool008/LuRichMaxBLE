import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:lurichmaxble/app/modules/authention/views/create_profile_view.dart';
import 'package:lurichmaxble/core/constants/app_colors.dart';
import 'package:lurichmaxble/app/global_widgets/common_button.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Card(child: Icon(Icons.arrow_back)),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset("assets/icons/otp_screen_icon.png")),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text(
                    "Verify OTP",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "An 5 digit code has been sent to +91 9995380399",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            OtpTextField(
              numberOfFields: 5,
              showFieldAsBox: true,
              fieldHeight: 54,
              fieldWidth: 54,
              borderColor: Colors.transparent,
              focusedBorderColor: Color(0xffDCDCDC),
              borderRadius: BorderRadius.circular(10),
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  },
                );
              }, // end onSubmit
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: CommonButton(
                buttonTextColor: Colors.white,
                buttonColor: AppColors.appColor,
                buttonText: "VERIFY OTP",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateProfileView(),
                    ),
                  );
                },
                buttonWidth: width * 0.91,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: TimerCountdown(
                format: CountDownTimerFormat.secondsOnly,
                endTime: DateTime.now().add(Duration(seconds: 34)),
                onEnd: () {
                  print("Timer finished");
                },
              ),
            ),
            // Center(
            //   child: Text(
            //     "00:120 Sec",
            //     style: TextStyle(
            //       fontSize: 14,
            //     ),
            //   ),
            // ),
            SizedBox(height: height / 9),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t receive code? ",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  "Re-Send",
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
      ),
    );
  }
}
