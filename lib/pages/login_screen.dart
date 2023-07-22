import 'package:booktheater/controllers/auth_controller.dart';
import 'package:booktheater/pages/sign_up.dart';
import 'package:booktheater/utils/mytheme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/social_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgotemailController = TextEditingController();

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
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    "Welcome Buddies",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'poppins',
                      color: Colors.white
                    ),
                  ),
                ),
                Text(
                  "Login to book your seat, I said it will yours",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 15,
                    color: Colors.white.withOpacity(0.7),
                  ),
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
                        "Login to your account",
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
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Mytheme.greyColor,
                            filled: true,
                            hintText: 'Username',
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
                          obscureText: true,
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Get.defaultDialog(
                              title: "Forgot Password?",
                              content: TextFormField(
                                controller: forgotemailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: "Email address",
                                  hintStyle: const TextStyle(
                                    color: Colors.black54,
                                  ),
                                  fillColor: Mytheme.greyColor,
                                  filled: true,
                                ),
                              ),
                              radius: 10,
                              onWillPop: () {
                                forgotemailController.text = "";

                                return Future.value(true);
                              },
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              confirm: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Mytheme.splash,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    )
                                ),
                                onPressed: () => AuthController.instance.forgotPassword(forgotemailController.text.trim()),
                                child: const Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Text(
                                    "Send Reset Mail",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Mytheme.splash,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )
                        ),
                        onPressed: () {
                          AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(12),
                          child: Center(
                            child: Text(
                              "Login",
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
                        child: SocialLoginButtons(onGoogleClick: () {
                          AuthController.instance.googleLogin();
                        }, onFacebookClick: () {}),
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
                          text: "Don't have an account? ",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          )
                        ),
                        TextSpan(
                          text: "Sign up",
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            // Navigator.push(context, MaterialPageRoute(builder: (_) => const SignUp()));
                            Get.to(() => const SignUp());
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
