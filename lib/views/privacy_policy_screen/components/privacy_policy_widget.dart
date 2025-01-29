import 'package:flutter/material.dart';
import '../../../../../global/constants/colors_resources.dart';
import '../../../../../global/constants/enum.dart';
import '../../../../../global/widget/global_container.dart';
import '../../../../../global/widget/global_image_loader.dart';
import '../../../../../global/widget/global_text.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  final String title;
  final String text;

  const PrivacyPolicyWidget({
    super.key,
    required this.title,
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
              GlobalText(
                str: title,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: ColorRes.black,
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
        ],
      ),
    );
  }
}
