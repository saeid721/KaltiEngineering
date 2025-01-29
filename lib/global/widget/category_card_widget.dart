import 'package:flutter/material.dart';
import '../constants/colors_resources.dart';
const double cardHeight = 150.0;
const double imageWidth = 50.0;
const double imageHeight = 50.0;

class CategoryCardWidget extends StatelessWidget {
  final String? imagePath; // Make imagePath optional
  final String title;
  final VoidCallback onTap;

  const CategoryCardWidget({
    super.key,
    this.imagePath, // imagePath can be null
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          height: cardHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorRes.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (imagePath != null)
                Image.asset(
                  imagePath!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              const SizedBox(height: 5),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: ColorRes.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
