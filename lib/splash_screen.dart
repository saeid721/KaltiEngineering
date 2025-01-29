import 'package:flutter/material.dart';
import 'global/constants/colors_resources.dart';
import 'global/constants/enum.dart';
import 'global/widget/global_image_loader.dart';
import 'global/widget/global_text.dart';
import 'views/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorRes.borderColor, ColorRes.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // Center Content with Card
            Center(
              child: Hero(
                tag: 'app_logo',
                child: GlobalImageLoader(
                  imagePath: 'assets/images/logo.png',
                  width: 250,
                  imageFor: ImageFor.asset,
                ),
              ),
            ),

            // Bottom Description and Loader
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 50.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // App Description
                    const GlobalText(
                      str: 'This app is internet-based.',
                      color: ColorRes.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      fontFamily: 'Rubik',
                      fontStyle: FontStyle.italic,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
