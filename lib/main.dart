import 'dart:io';

import 'package:booktheater/controllers/auth_controller.dart';
import 'package:booktheater/pages/splash_screen.dart';
import 'package:booktheater/utils/mytheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: "AIzaSyBkSV3KBZ8weLQENTEB__Z6GtolTNxaUVw",
          appId: "1:121103568032:android:52f58f5348d3b2d9ac4dc5",
          messagingSenderId: "121103568032",
          projectId: "booktheater-e712f",
        ))
      : await Firebase.initializeApp();
  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Mytheme.myLightTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
