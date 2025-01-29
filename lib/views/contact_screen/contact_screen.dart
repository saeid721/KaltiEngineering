import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global/constants/colors_resources.dart';
import '../../global/widget/custom_app_bar.dart';
import '../../global/widget/global_app_bar.dart';
import '../notification_screen/notification_screen.dart';
import 'components/contact_widget.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
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
          title: 'যোগাযোগ',
          notiOnTap: () {},
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => NotificationScreen());
              },
              icon: const Icon(Icons.notifications_on_rounded, color: ColorRes.white,),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AboutWidget(
                title: 'Feni City',
                subTitle: 'অ্যাপ এর মাধ্যমে যে কোন প্রতিষ্ঠান বা পণ্যের বিজ্ঞাপন দিন।',
                imagePath: 'assets/images/feniCity.png',
                text:
                    """ফেনীর সকল প্রিয় নাগরিকদের জানাই আন্তরিক শুভেচ্ছা। যারা তাদের ব্যবসা বা প্রতিষ্ঠানের প্রসার ও প্রচারের কথা ভাবছেন, তাদের জন্য একটি দুর্দান্ত সুযোগ নিয়ে এসেছে ফেনী সিটি অ্যাপ। ডিজিটাল মার্কেটিং এর আধুনিক সুবিধার মাধ্যমে আপনি সহজেই আপনার পণ্য বা প্রতিষ্ঠানের ব্র্যান্ডকে মানুষের কাছে পরিচিত করতে পারেন এবং আস্থা তৈরি করতে পারেন।
                    
কেন ডিজিটাল মার্কেটিং?
প্রচারই প্রসারের মূল চাবিকাঠি। বিজ্ঞাপনের মাধ্যমে আপনার ব্যবসা বা সেবার তথ্য আরো বেশি মানুষের কাছে পৌঁছে যাবে, যা আপনার প্রতিষ্ঠানকে এগিয়ে নিয়ে যাবে। ফেনী সিটি অ্যাপের মাধ্যমে আপনি আপনার প্রতিষ্ঠানের বিজ্ঞাপন দিতে পারবেন, যা মানুষের নজরে আসার একটি আধুনিক ও কার্যকর পদ্ধতি।

বিজ্ঞাপনের সুযোগ সুবিধা:
ফেনী সিটি অ্যাপে বিজ্ঞাপন দিয়ে আপনি যেকোনো ধরনের ব্যবসার প্রসার ঘটাতে পারবেন। যেমন:
হাসপাতাল বা ক্লিনিক, ডায়াগনস্টিক সেন্টার, রেস্তোরাঁ বা ক্যাফে, দোকান বা শোরুম, ই-কমার্স এবং অন্যান্য যেকোনো ধরনের ব্যবসা।

কীভাবে যোগাযোগ করবেন?
আপনার প্রতিষ্ঠানকে ডিজিটালভাবে তুলে ধরতে এবং বিজ্ঞাপনের মাধ্যমে পরিচিতি বাড়াতে আমাদের সাথে আজই যোগাযোগ করুন। আমরা নিশ্চিত করব আপনার বিজ্ঞাপন সর্বোচ্চ সংখ্যক মানুষের কাছে পৌঁছায়।

ফেনীর মানুষের জন্য সেরা সুযোগগুলো কাজে লাগান এবং আপনার ব্যবসাকে আরও এক ধাপ এগিয়ে নিয়ে যান!

যোগাযোগ করুন:
আমাদের টিম সর্বদা আপনার সহায়তায় প্রস্তুত। বিস্তারিত জানতে এখনই যোগাযোগ করুন।

আসুন, ফেনী সিটি অ্যাপের মাধ্যমে আপনার ব্যবসার সফলতা নিশ্চিত করি!
""",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
