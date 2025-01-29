import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'controller/controller.dart';
import 'global/constants/colors_resources.dart';
import 'splash_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WebViewLoadingController(),
      child: KaltiApp(),
    ),
  );
}

class KaltiApp extends StatelessWidget {
  const KaltiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: ColorRes.primaryColor),
      title: 'Kalti Engineering',
      home: const SplashScreen(),
    );
  }
}
