import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/widget/global_text.dart';
import '../../global/constants/enum.dart';
import '../../global/widget/global_app_bar.dart';
import '../../global/widget/global_image_loader.dart';
import '../../global/widget/global_sizedbox.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: GlobalAppBar(
          title: 'প্রোফাইল',
          notiOnTap: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sizedBoxH(10),
            Container(
              width: Get.width,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorRes.white,
                boxShadow: [
                  BoxShadow(color: ColorRes.grey.withOpacity(0.3), blurRadius: 5),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1, color: ColorRes.primaryColor),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: GlobalImageLoader(
                                imagePath: "assets/images/doctors/doctor.jpg",
                                height: 80,
                                width: 80,
                                fit: BoxFit.fill,
                                imageFor: ImageFor.asset,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: ColorRes.black.withOpacity(0.5)),
                                child: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: ColorRes.white,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      sizedBoxW(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GlobalText(
                              str: " আফিয়া আক্তার",
                              color: ColorRes.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                              fontFamily: 'Rubik',
                            ),
                            GlobalText(
                              str: "afiya123@gmail.com",
                              color: ColorRes.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.center,
                              fontFamily: 'Rubik',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  sizedBoxH(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const GlobalText(
                        str: "মোবাইল নাম্বারঃ ",
                        color: ColorRes.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.left,
                      ),
                      GlobalText(
                        str: " 01700 00 00 00",
                        color: ColorRes.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  sizedBoxH(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const GlobalText(
                        str: "বিভাগঃ ",
                        color: ColorRes.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.left,
                      ),
                      GlobalText(
                        str: "Dhaka",
                        color: ColorRes.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  sizedBoxH(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const GlobalText(
                        str: "জেলাঃ ",
                        color: ColorRes.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.left,
                      ),
                      GlobalText(
                        str: "Dhaka",
                        color: ColorRes.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  sizedBoxH(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const GlobalText(
                        str: "উপজেলাঃ ",
                        color: ColorRes.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.left,
                      ),
                      GlobalText(
                        str: "Dhaka",
                        color: ColorRes.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  sizedBoxH(10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
