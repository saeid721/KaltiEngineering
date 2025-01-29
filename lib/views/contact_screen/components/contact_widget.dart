import 'package:flutter/material.dart';
import '../../../../../global/constants/colors_resources.dart';
import '../../../../../global/constants/enum.dart';
import '../../../../../global/widget/global_container.dart';
import '../../../../../global/widget/global_image_loader.dart';
import '../../../../../global/widget/global_text.dart';

class AboutWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  final String text;

  const AboutWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalContainer(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GlobalContainer(
                child: GlobalImageLoader(
                  imagePath: imagePath,
                  height: 80,
                  imageFor: ImageFor.asset,
                ),
              ),
              GlobalText(
                str: subTitle,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ColorRes.grey,
                textAlign: TextAlign.center,
              ),
              const Divider(),
              GlobalText(
                str: text,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.justify,
              ),
            ],
          ),

          // const Divider(),

          // Developer Info Section
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     const GlobalText(
          //       str: "Develop by -",
          //       fontSize: 12,
          //       fontWeight: FontWeight.w400,
          //       color: ColorRes.grey,
          //     ),
          //     Image.asset('assets/images/stitbd_logo.png', height: 82, fit: BoxFit.cover),
          //     sizedBoxH(10),
          //   ],
          // ),
        ],
      ),
    );
  }
}
