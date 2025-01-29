import 'package:flutter/material.dart';
import '../../global/constants/colors_resources.dart';
import '../../global/constants/images.dart';
import '../../global/widget/global_image_loader.dart';
import '../../global/widget/global_sizedbox.dart';
import '../../global/widget/global_text.dart';
import '../constants/enum.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onSearchTap;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorRes.primaryColor,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GlobalImageLoader(
            imagePath: Images.appLogo,
            width: 40,
            fit: BoxFit.fill,
            imageFor: ImageFor.asset,
          ),
          Expanded(
            child: GlobalText(
              str: title,
              color: ColorRes.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
              fontFamily: 'Rubik',
              maxLines: 2,
            ),
          ),
          // Row(
          //   children: [
          //     GestureDetector(
          //       onTap: onSearchTap,
          //       child: const Icon(
          //         Icons.search,
          //         color: ColorRes.white,
          //         size: 22,
          //       ),
          //     ),
          //     sizedBoxW(15),
          //   ],
          // ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
