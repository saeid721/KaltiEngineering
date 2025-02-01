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
import 'views/website_screen/about_screen.dart';
import 'views/website_screen/blog_screen.dart';
import 'views/contact_screen/contact_screen.dart';
import 'views/website_screen/faq_screen.dart';
import 'views/website_screen/gallery_screen.dart';
import 'views/home_screen.dart';
import 'views/notification_screen/notification_screen.dart';
import 'views/privacy_policy_screen/privacy_policy_screen.dart';
import 'views/website_screen/privacy_policy_screen.dart';
import 'views/website_screen/product_screen.dart';
import 'views/website_screen/service_screen.dart';
import 'views/website_screen/trams_condition_screen.dart';
import 'views/website_screen/video_screen.dart';

class CustomDrawerScreen extends StatefulWidget {
  const CustomDrawerScreen({super.key});

  @override
  State<CustomDrawerScreen> createState() => _CustomDrawerScreenState();
}

class _CustomDrawerScreenState extends State<CustomDrawerScreen> {
  int isClick = 0;
  List<GlobalMenuModel> menuItem = [
    GlobalMenuModel(img: Images.homeInc, text: 'Home'),
    GlobalMenuModel(img: Images.contactInc, text: 'Contact'),
    GlobalMenuModel(img: Images.greenEnergyInc, text: 'Energy Services'),
    // GlobalMenuModel(img: Images.productInc, text: 'Products'),
    GlobalMenuModel(img: Images.videoInc, text: 'Videos'),
    GlobalMenuModel(img: Images.pictureInc, text: 'Gallery'),
    GlobalMenuModel(img: Images.informationInc, text: 'About Us'),
    //GlobalMenuModel(img: Images.appLogo, text: 'Contact Us'),
    GlobalMenuModel(img: Images.blogInc, text: 'Blog'),
    // GlobalMenuModel(img: Images.faqInc, text: 'FAQ'),
    GlobalMenuModel(img: Images.termsAndConditionsInc, text: 'Term & Conditions'),
    GlobalMenuModel(img: Images.privacyAndPolicyInc, text: 'Privacy & Policy'),
    // GlobalMenuModel(img: Images.notificationInc, text: 'Notification'),
    GlobalMenuModel(img: Images.shareInc, text: 'Share'),
    GlobalMenuModel(img: Images.ratingInc, text: 'Rating'),
    GlobalMenuModel(img: Images.policyInc, text: 'Privacy of App'),
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
              padding: const EdgeInsets.only(
                  left: 20, right: 10, top: 50, bottom: 10),
              decoration: BoxDecoration(
                color: ColorRes.white100,
                border: Border.all(color: ColorRes.primaryColor, width: .3),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GlobalImageLoader(
                  imagePath: 'assets/images/logo.png',
                  width: 220,
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
                              Get.to(() => const ServiceScreen());
                              break;
                            // case 3:
                            //   Get.to(() => const ProductScreen());
                            //   break;
                            case 3:
                              Get.to(() => const VideoScreen());
                              break;
                            case 4:
                              Get.to(() => const GalleryScreen());
                              break;
                            case 5:
                              Get.to(() => const AboutScreen());
                              break;
                            case 6:
                              Get.to(() => const BlogScreen());
                              break;
                            // case 8:
                            //   Get.to(() => const FaqScreen());
                            //   break;
                            case 7:
                              Get.to(() => const TramsConditionScreen());
                              break;
                            case 8:
                              Get.to(() => const PrivacyPolicyScreen());
                              break;
                            // case 11:
                            //   Get.to(() => const NotificationScreen());
                            //   break;
                            case 9:
                              _shareApp(); // Trigger share app function
                              break;
                            case 10:
                            // Add any action for Rating here
                              break;
                            case 11:
                              Get.to(() => const AppPrivacyPolicyScreen());
                              break;
                          }
                        },
                        child: Container(
                          width: Get.width,
                          //margin: const EdgeInsets.only(bottom: 5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 8),
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
                                // color: isClick == index
                                //     ? Colors.white
                                //     : ColorRes.primaryColor,
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
