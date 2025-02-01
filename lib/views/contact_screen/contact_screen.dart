import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../custom_drawer_screen.dart';
import '../../global/constants/colors_resources.dart';
import '../../global/constants/images.dart';
import '../../model/model.dart';
import '../../global/widget/global_app_bar.dart';
import '../../global/widget/global_text.dart';
import '../social_media_screen/blogger_screen.dart';
import '../social_media_screen/facebook_screen.dart';
import '../social_media_screen/google_screen.dart';
import '../social_media_screen/instagram_screen.dart';
import '../social_media_screen/linkedin_screen.dart';
import '../social_media_screen/pinterest_screen.dart';
import '../social_media_screen/reddit_screen.dart';
import '../social_media_screen/telegram_screen.dart';
import '../social_media_screen/threads_screen.dart';
import '../social_media_screen/tiktok_screen.dart';
import '../social_media_screen/tumblr_screen.dart';
import '../social_media_screen/twitter_screen.dart';
import '../social_media_screen/vimeo_screen.dart';
import '../social_media_screen/we_chat_screen.dart';
import '../social_media_screen/whatsapp_screen.dart';
import '../social_media_screen/youtube_screen.dart';
import 'components/contact_widget.dart';
import 'components/social_media_widget.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  List<GlobalMenuModel> menuItem = [
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
    GlobalMenuModel(img: Images.googleInc, text: 'Business'),
    GlobalMenuModel(img: Images.bloggerInc, text: 'Blogger'),
    GlobalMenuModel(img: Images.whatsAppInc, text: 'WhatsApp'),
    GlobalMenuModel(img: Images.telegramInc, text: 'Telegram'),
    // GlobalMenuModel(img: Images.weChatInc, text: 'WeChat'),
    // GlobalMenuModel(img: Images.redditInc, text: 'Reddit'),
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
              //const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.all(10),
                margin:  const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ColorRes.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: ColorRes.primaryColor, width: .3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ContactDetailsWidget(
                          name: "Kalti Engineering",
                          address: "House# 509/3, Polok Road, South Manipur, Mirpur-2, Dhaka-1216, Bangladesh.",
                          email: "info@kaltiEngineering.com",
                          phone: "+88 01822 25 82 55",
                          call: "Call",
                          sms: "SMS",
                          mail: "e-Mail",
                          map: "Map",
                          onTap: () {},
                        ),
                  ],
                ),
              ),
              GlobalText(
                str: "Don’t Miss Out – Follow Us for Updates",
                color: ColorRes.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),

              GridView.builder(
                  itemCount: menuItem.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      mainAxisExtent: 50),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Get.to(() => const FacebookScreen());
                            break;
                          case 1:
                            Get.to(() => const LinkedInScreen());
                            break;
                          case 2:
                            Get.to(() => const InstagramScreen());
                            break;
                          case 3:
                            Get.to(() => const ThreadsScreen());
                            break;
                          case 4:
                            Get.to(() => const TwitterScreen());
                            break;
                          case 5:
                            Get.to(() => const TikTokScreen());
                            break;
                          case 6:
                            Get.to(() => const YouTubeScreen());
                            break;
                          case 7:
                            Get.to(() => const VimeoScreen());
                            break;
                          case 8:
                            Get.to(() => const PinterestScreen());
                            break;
                          case 9:
                            Get.to(() => const TumblrScreen());
                            break;
                          case 10:
                            Get.to(() => const GoogleScreen());
                            break;
                          case 11:
                            Get.to(() => const BloggerScreen());
                            break;
                          case 12:
                            Get.to(() => const WhatsAppScreen());
                            break;
                          case 13:
                            Get.to(() => const TelegramScreen());
                            break;
                        //   case 14:
                        //     Get.to(() => const WeChatScreen());
                        //     break;
                        // case 15:
                        //   Get.to(() => const RedditScreen());
                        //   break;
                        }
                      },
                      child: SocialMediaWidget(
                        height: 24,
                        width: 24,
                        imagePath: menuItem[index].img,
                        text: menuItem[index].text,
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
