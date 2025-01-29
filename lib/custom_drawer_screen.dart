import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../../global/constants/images.dart';
import '../../../../../global/model.dart';
import '../../../../../global/widget/global_container.dart';
import '../../../../../global/widget/global_image_loader.dart';
import '../../../../../global/widget/global_text.dart';
import '../global/constants/colors_resources.dart';
import 'global/constants/enum.dart';
import 'views/contact_screen/contact_screen.dart';
import 'views/home_screen.dart';
import 'views/notification_screen/notification_screen.dart';
import 'views/privacy_policy_screen/privacy_policy_screen.dart';
import 'views/profile_screen/profile_screen.dart';

class CustomDrawerScreen extends StatefulWidget {
  const CustomDrawerScreen({super.key});

  @override
  State<CustomDrawerScreen> createState() => _CustomDrawerScreenState();
}

class _CustomDrawerScreenState extends State<CustomDrawerScreen> {
  int isClick = 0;
  List<GlobalMenuModel> menuItem = [
    GlobalMenuModel(img: Images.homeInc, text: 'হোম'),
    GlobalMenuModel(img: Images.contactInc, text: 'যোগাযোগ'),
    // GlobalMenuModel(img: Images.userInc, text: 'প্রোফাইল'),
    GlobalMenuModel(img: Images.notificationInc, text: 'নোটিফিকেশন'),
    GlobalMenuModel(img: Images.share, text: 'শেয়ার করুন'),
    GlobalMenuModel(img: Images.rating, text: 'রেটিং দিন'),
    GlobalMenuModel(img: Images.privacyPolicy, text: 'গোপনীয়তা নীতি'),
  ];

  // Function to handle app share
  void _shareApp() {
    final String message = "Check out this amazing app! [Your App Link Here]";
    Share.share(message);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: GlobalContainer(
        height: Get.height,
        width: Get.width,
        color: ColorRes.white,
        child: Column(
          children: [
            Container(
              width: Get.width,
              color: ColorRes.borderColor,
              padding: const EdgeInsets.only(
                  left: 20, right: 10, top: 60, bottom: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GlobalImageLoader(
                  imagePath: 'assets/images/logo.png',
                  width: 250,
                  imageFor: ImageFor.asset,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                    itemCount: menuItem.length,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () async {
                          setState(() {
                            isClick = index;
                          });
                          log('Index: $index');
                          switch (index) {
                            case 0:
                              Get.to(() => const HomeScreen());
                              break;
                            case 1:
                              Get.to(() => const ContactScreen());
                              break;
                            case 2:
                              Get.to(() => const NotificationScreen());
                              break;
                            case 3:
                              _shareApp(); // Trigger share app function
                              break;
                            case 4:
                              // Add any action for Rating here
                              break;
                            case 5:
                              Get.to(() => const PrivacyPolicyScreen());
                              break;
                            case 6:
                              Get.to(() => const ProfileScreen());
                              break;
                          }
                        },
                        child: Container(
                          width: Get.width,
                          margin: const EdgeInsets.only(bottom: 5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: isClick == index
                                ? ColorRes.primaryColor
                                : Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GlobalImageLoader(
                                imagePath: menuItem[index].img,
                                height: 20,
                                width: 20,
                                fit: BoxFit.fill,
                                color: isClick == index
                                    ? Colors.white
                                    : ColorRes.primaryColor,
                              ),
                              const SizedBox(width: 10),
                              GlobalText(
                                str: menuItem[index].text,
                                color: isClick == index
                                    ? ColorRes.white
                                    : ColorRes.black,
                                fontSize: 16,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
