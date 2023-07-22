import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.3,
      width: size.width,
      child: Image.asset(
        "assets/images/Slider_image.png",
        fit: BoxFit.cover,
      ),
    );
  }
}

