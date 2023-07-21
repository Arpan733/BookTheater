import 'package:booktheater/utils/mytheme.dart';
import 'package:flutter/material.dart';

class SocialLoginButtons extends StatelessWidget {
  final Function() onGoogleClick;
  final Function() onFacebookClick;

  const SocialLoginButtons({Key? key, required this.onGoogleClick, required this.onFacebookClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Material(
            color: Mytheme.redLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(
                color: Mytheme.redBorder,
                width: 0.2,
              )
            ),
            child: InkWell(
              onTap: onGoogleClick,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/Google.png",
                      width: 25,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Google",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Material(
            color: Mytheme.blueLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(
                color: Mytheme.blueBorder,
                width: 0.2
              ),
            ),
            child: InkWell(
              onTap: onFacebookClick,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/Facebook.png",
                      width: 25,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                        "Facebook",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

