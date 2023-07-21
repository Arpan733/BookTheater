// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:booktheater/pages/home_page.dart';
import 'package:booktheater/utils/mytheme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../pages/login_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  bool isLoging = false;
  final FirebaseAuth auth = FirebaseAuth.instance;
  
  @override
  void onReady() {
    super.onReady();
    
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, loginRedirect);
  }

  loginRedirect(User? user) {
    Timer(Duration(seconds: isLoging ? 0 : 2), () {
      if(user == null) {
        isLoging = false;
        update();
        Get.offAll(() => const LoginScreen());
      } else {
        isLoging = true;
        update();
        Get.offAll(() => const HomePage());
      }
    });
  }

  void login (email, password) async {
    try {
      isLoging = true;
      update();

      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      getErrorSnackBar("Login failed.", e);
    }
  }

  void registerUser (email, password) async {
    try {
      isLoging = true;
      update();
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      getErrorSnackBar("Account Creating Failed", e);
    }
  }

  void googleLogin() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    isLoging = true;
    update();

    try {
      googleSignIn.disconnect();
    } catch (e) {

    }

    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if(googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final credentials = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await auth.signInWithCredential(credentials);
      }
    } on FirebaseAuthException catch (e) {
      getErrorSnackBar("Google login Failed", e);
    }
  }

  getErrorSnackBar(String message, _) {
    Get.snackbar(
      "Error",
      "$message\n${_.message}",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Mytheme.redBorder,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  void SignOut() async {
    auth.signOut();
  }
}