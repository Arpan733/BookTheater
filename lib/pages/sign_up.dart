import 'package:booktheater/controllers/auth_controller.dart';
import 'package:booktheater/controllers/input_validators.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/mytheme.dart';
import '../utils/social_buttons.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cnfpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      backgroundColor: Mytheme.splash,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/Logo.png',
                      height: 100,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Book\nTheater",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.all(19),
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Create your account",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Mytheme.splash,
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextField(
                          cursorColor: Colors.black45,
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Mytheme.greyColor,
                            filled: true,
                            hintText: 'Name',
                            hintStyle: const TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextField(
                          cursorColor: Colors.black45,
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Mytheme.greyColor,
                            filled: true,
                            hintText: 'Email Address',
                            hintStyle: const TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextField(
                          obscureText: true,
                          cursorColor: Colors.black45,
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Mytheme.greyColor,
                            filled: true,
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextField(
                          obscureText: true,
                          cursorColor: Colors.black45,
                          controller: cnfpasswordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Mytheme.greyColor,
                            filled: true,
                            hintText: 'Confirm Password',
                            hintStyle: const TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Mytheme.splash,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                        ),
                        onPressed: () async {
                          if(InputValidator.validateField("Name", nameController.text.trim()) &&
                          InputValidator.validateField("Email", emailController.text.trim()) &&
                          InputValidator.validateField("Password", passwordController.text.trim())) {
                            if(InputValidator.validatePassword(passwordController.text.trim(), cnfpasswordController.text.trim())) {
                              AuthController.instance.registerUser(emailController.text.trim(), passwordController.text.trim());
                            }
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(12),
                          child: Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                "Or"
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: SocialLoginButtons(onGoogleClick: () {}, onFacebookClick: () {}),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )
                        ),
                        TextSpan(
                          text: "Login",
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            // Navigator.pop(context);
                            Get.back();
                          },
                        ),
                        const TextSpan(
                          text: " here.",
                          style: TextStyle(
                              fontWeight: FontWeight.w700
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

