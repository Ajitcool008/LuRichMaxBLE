import 'package:flutter/material.dart';

class TopImageLogin extends StatelessWidget {
  final String topImage;
  final double imageHeight;
  const TopImageLogin({
    super.key,
    required this.topImage,
    required this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width / 1,
      height: imageHeight,
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(topImage)),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )),
    );
  }
}
