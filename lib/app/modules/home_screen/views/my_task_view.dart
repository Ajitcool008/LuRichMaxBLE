import 'package:flutter/material.dart';
import 'package:lurichmaxble/core/constants/app_colors.dart';
import 'package:lurichmaxble/app/modules/authention/widgets/input_text_field.dart';

class MyTask extends StatelessWidget {
  const MyTask({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Image.asset("assets/icons/proposal_screen_appbar.dart.png"),
          //       SizedBox(width: 10),
          //       Text(
          //         "Flat- 209, Kavuri Hills, Madhapur, Telangana\n500033",
          //         style: TextStyle(fontSize: 13, color: Color(0xff757575)),
          //       ),
          //       SizedBox(
          //         height: 50,
          //         width: 50,
          //         child: Card(
          //           color: Colors.white,
          //           child: Image.asset(
          //             "assets/icons/proposal_app_bar_icon2.png",
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: InputTextField(
              hintText: "Search by Name",
              suffixWidget: Card(
                color: AppColors.appColor,
                child: Icon(Icons.search, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: height / 5,
            width: width / 1.07,
            child: Card(
              color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      width: 64,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent[100],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          topLeft: Radius.circular(5),
                        ),
                      ),

                      child: Text(
                        "Onsite",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.appColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Guitar pick up repairs",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("156,Sohna Road Sector-49, Gurgoan- India"),
                          Row(
                            children: [
                              Icon(Icons.watch_later_outlined),
                              Text("Morning, Afternoon"),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.calendar_month),
                              Text("March 15, 2025"),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\$100",
                            style: TextStyle(
                              color: AppColors.appColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(color: Color(0xffF1F1F1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Offer :- 10",
                          style: TextStyle(
                            color: AppColors.appColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: const <TextSpan>[
                              TextSpan(
                                text: 'Status:- ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff808083),
                                ),
                              ),
                              TextSpan(
                                text: 'Accepted',
                                style: TextStyle(
                                  color: AppColors.appColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),

          SizedBox(
            height: height / 5,
            width: width / 1.07,
            child: Card(
              color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      width: 64,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent[100],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          topLeft: Radius.circular(5),
                        ),
                      ),

                      child: Text(
                        "Remote",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.appColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Guitar pick up repairs",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("156,Sohna Road Sector-49, Gurgoan- India"),
                          Row(
                            children: [
                              Icon(Icons.watch_later_outlined),
                              Text("Morning, Afternoon"),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.calendar_month),
                              Text("March 15, 2025"),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 50,
                            child: Text(
                              "\$100",
                              style: TextStyle(
                                color: AppColors.appColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(color: Color(0xffF1F1F1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Offer :- 4",
                          style: TextStyle(
                            color: AppColors.appColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: const <TextSpan>[
                              TextSpan(
                                text: 'Status:- ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff808083),
                                ),
                              ),
                              TextSpan(
                                text: 'Cancelled',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
