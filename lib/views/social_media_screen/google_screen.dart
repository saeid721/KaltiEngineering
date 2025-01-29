import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../global/widget/global_app_bar.dart';

class GoogleScreen extends StatefulWidget {
  const GoogleScreen({super.key});

  @override
  State<GoogleScreen> createState() => _GoogleScreenState();
}

class _GoogleScreenState extends State<GoogleScreen> {
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
        Uri.parse('https://g.co/kgs/6bsVznX'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: GlobalAppBar(
          title: 'Facebook',
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
