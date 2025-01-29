import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../global/widget/global_app_bar.dart';

class TikTokScreen extends StatefulWidget {
  const TikTokScreen({super.key});

  @override
  State<TikTokScreen> createState() => _TikTokScreenState();
}

class _TikTokScreenState extends State<TikTokScreen> {
  late WebViewController controller;
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse('https://snaptik.app/en2'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: GlobalAppBar(
          title: 'TikTok',
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          loadingPercentage < 100
              ? LinearProgressIndicator(
                  color: Colors.red,
                  value: loadingPercentage / 100.0,
                )
              : Container(),
        ],
      ),
    );
  }
}
