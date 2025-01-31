import 'package:flutter/material.dart';
import '../../global/widget/global_app_bar.dart';
import 'components/privacy_policy_widget.dart';

class AppPrivacyPolicyScreen extends StatefulWidget {
  const AppPrivacyPolicyScreen({super.key});

  @override
  State<AppPrivacyPolicyScreen> createState() => _AppPrivacyPolicyScreenState();
}

class _AppPrivacyPolicyScreenState extends State<AppPrivacyPolicyScreen> {
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
          title: 'Privacy & Policy',
          notiOnTap: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              PrivacyPolicyWidget(
                title: 'Privacy & Policy',
                text:
                    """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.""",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
