import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'global/constants/colors_resources.dart';
import 'splash_screen.dart';

void main() {
  runApp(const SauLibraryApp());
}

class SauLibraryApp extends StatelessWidget {
  const SauLibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: ColorRes.lavender),
      title: 'All In One Downloader',
      home: const SplashScreen(),
    );
  }
}
