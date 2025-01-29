import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../custom_drawer_screen.dart';
import '../global/constants/colors_resources.dart';
import '../global/constants/images.dart';
import '../global/model.dart';
import '../global/widget/global_app_bar.dart';
import '../global/widget/global_container.dart';
import '../global/widget/home_menu_widget.dart';
import 'about_screen.dart';
import 'blog_screen.dart';
import 'contact_screen/contact_screen.dart';
import 'faq_screen.dart';
import 'gallery_screen.dart';
import 'kalti_home_screen.dart';
import 'privacy_policy_screen.dart';
import 'service_screen.dart';
import 'solution_screen.dart';
import 'social_media_screen/linkedin_screen.dart';
import 'social_media_screen/pinterest_screen.dart';
import 'social_media_screen/telegram_screen.dart';
import 'social_media_screen/threads_screen.dart';
import 'social_media_screen/twitter_screen.dart';
import 'social_media_screen/vimeo_screen.dart';
import 'social_media_screen/tiktok_screen.dart';
import 'social_media_screen/instagram_screen.dart';
import 'social_media_screen/tumblr_screen.dart';
import 'social_media_screen/facebook_screen.dart';
import 'social_media_screen/toutube_thumbnail_screen.dart';
import 'product_screen.dart';
import 'social_media_screen/we_chat_screen.dart';
import 'social_media_screen/whatsapp_screen.dart';
import 'social_media_screen/youtube_screen.dart';
import 'trams_condition_screen.dart';
import 'video_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  List<GlobalMenuModel> menuItem = [
    GlobalMenuModel(img: Images.homeInc, text: 'Home'),
    GlobalMenuModel(img: Images.appLogo, text: 'Solution'),
    GlobalMenuModel(img: Images.appLogo, text: 'Service'),
    GlobalMenuModel(img: Images.appLogo, text: 'Product'),
    GlobalMenuModel(img: Images.appLogo, text: 'Video'),
    GlobalMenuModel(img: Images.appLogo, text: 'Gallery'),
    GlobalMenuModel(img: Images.appLogo, text: 'About Us'),
    GlobalMenuModel(img: Images.appLogo, text: 'Contact Us'),
    GlobalMenuModel(img: Images.appLogo, text: 'Blog'),
    GlobalMenuModel(img: Images.appLogo, text: 'Term & Conditions'),
    GlobalMenuModel(img: Images.appLogo, text: 'Privacy & Policy'),
    GlobalMenuModel(img: Images.appLogo, text: 'FAQ'),

    GlobalMenuModel(img: Images.whatsAppInc, text: 'WhatsApp'),
    GlobalMenuModel(img: Images.telegramInc, text: 'Telegram'),
    GlobalMenuModel(img: Images.facebookInc, text: 'Facebook'),
    GlobalMenuModel(img: Images.linkedInInc, text: 'Linkedin'),
    GlobalMenuModel(img: Images.instagramInc, text: 'Instagram'),
    GlobalMenuModel(img: Images.threadsInc, text: 'Threads'),
    GlobalMenuModel(img: Images.twitterInc, text: 'Twitter'),
    GlobalMenuModel(img: Images.tikTokInc, text: 'TikTok'),
    GlobalMenuModel(img: Images.youTubeInc, text: 'YouTube'),
    GlobalMenuModel(img: Images.vimeoInc, text: 'Vimeo'),
    GlobalMenuModel(img: Images.pinterestInc, text: 'Pinterest'),
    GlobalMenuModel(img: Images.tumblrInc, text: 'Tumblr'),
    // GlobalMenuModel(img: Images.weChatInc, text: 'WeChat'),
  ];

  int currentIndex = 0;
  final CarouselController buttonCarouselController = CarouselController();

  final List<String> sliderImage = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: GlobalAppBar(
          title: 'Kalti Engineering',
          notiOnTap: () {},
          leading: GestureDetector(
            onTap: () {
              if (drawerKey.currentState!.isDrawerOpen) {
                drawerKey.currentState!.closeDrawer();
              } else {
                drawerKey.currentState!.openDrawer();
              }
            },
            child: const Icon(Icons.menu, color: ColorRes.white),
          ),
        ),
      ),
      key: drawerKey,
      drawer: const CustomDrawerScreen(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 5,
            children: [
              // Carousel Slider
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 5),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: CarouselSlider(
                    items: sliderImage.map((item) {
                      return GlobalContainer(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          child: Image.asset(
                            item,
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: true,
                      aspectRatio: 2,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: sliderImage.asMap().entries.map((entry) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 2,
                    width: currentIndex == entry.key ? 15 : 7,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentIndex == entry.key
                          ? ColorRes.primaryColor
                          : ColorRes.borderColor,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 8),

              GridView.builder(
                  itemCount: menuItem.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      mainAxisExtent: 77),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Get.to(() => const KaltiHomeScreen());
                            break;
                          case 1:
                            Get.to(() => const SolutionScreen());
                            break;
                          case 2:
                            Get.to(() => const ServiceScreen());
                            break;
                          case 3:
                            Get.to(() => const ProductScreen());
                            break;
                          case 4:
                            Get.to(() => const VideoScreen());
                            break;
                          case 5:
                            Get.to(() => const GalleryScreen());
                            break;
                          case 6:
                            Get.to(() => const AboutScreen());
                            break;
                          case 7:
                            Get.to(() => const ContactScreen());
                            break;
                          case 8:
                            Get.to(() => const BlogScreen());
                            break;
                          case 9:
                            Get.to(() => const TramsConditionScreen());
                            break;
                          case 10:
                            Get.to(() => const PrivacyPolicyScreen());
                            break;
                          case 11:
                            Get.to(() => const FaqScreen());
                            break;
                          case 12:
                            Get.to(() => const FacebookScreen());
                            break;
                          case 13:
                            Get.to(() => const TikTokScreen());
                            break;
                          case 14:
                            Get.to(() => const InstagramScreen());
                            break;
                          case 15:
                            Get.to(() => const LinkedInScreen());
                            break;
                          case 16:
                            Get.to(() => const ThreadsScreen());
                            break;
                          case 17:
                            Get.to(() => const TwitterScreen());
                            break;
                          case 18:
                            Get.to(() => const YouTubeScreen());
                            break;
                          case 19:
                            Get.to(() => const YouTubeThumbnailScreen());
                            break;
                          case 20:
                            Get.to(() => const VimeoScreen());
                            break;
                          case 21:
                            Get.to(() => const PinterestScreen());
                            break;
                          case 22:
                            Get.to(() => const ProductScreen());
                            break;
                          case 23:
                            Get.to(() => const TumblrScreen());
                            break;
                          case 24:
                            Get.to(() => const TelegramScreen());
                            break;
                          case 25:
                            Get.to(() => const WhatsAppScreen());
                            break;
                          case 26:
                            Get.to(() => const WeChatScreen());
                            break;
                        }
                      },
                      child: HomeMenuWidget(
                        height: 30,
                        width: 30,
                        maxLines: 1,
                        imagePath: menuItem[index].img,
                        text: menuItem[index].text,
                        subText: menuItem[index].subText ?? "",
                      ),
                    );
                  }),

              //const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
