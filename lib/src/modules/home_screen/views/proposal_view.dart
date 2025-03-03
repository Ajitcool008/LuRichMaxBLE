import 'package:flutter/material.dart';
import 'package:lurichmaxble/components/app_colors.dart';
import 'package:lurichmaxble/components/input_text_field.dart';

class ProposalView extends StatelessWidget {
  const ProposalView({super.key});

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
            height: height / 6,
            width: width / 1.07,
            child: Card(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        " Guitar pick up repairs",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(" 156,Sohna Road Sector-49, Gurgoan- India"),
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
                      Row(
                        children: [
                          Icon(Icons.near_me_outlined, size: 13),
                          Text("5KM", style: TextStyle(fontSize: 13)),
                        ],
                      ),
                      Text(
                        "\$100",
                        style: TextStyle(
                          color: AppColors.appColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                      Text(
                        "Onsite",
                        style: TextStyle(
                          color: AppColors.appColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height / 6,
            width: width / 1.07,
            child: Card(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "CAD drawings for steel formwork \nconcept",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Row(
                        children: [
                          Icon(Icons.watch_later_outlined),
                          Text("Morning, Afternoon"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.calendar_month),
                          Text("March 17, 2025"),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.near_me_outlined, size: 13),
                          Text("5KM", style: TextStyle(fontSize: 13)),
                        ],
                      ),
                      Text(
                        "\$80",
                        style: TextStyle(
                          color: AppColors.appColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                      Text(
                        "Remote",
                        style: TextStyle(
                          color: AppColors.appColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
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
