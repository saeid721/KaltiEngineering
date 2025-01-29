import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../global/widget/global_app_bar.dart';

class VimeoScreen extends StatefulWidget {
  const VimeoScreen({super.key});

  @override
  State<VimeoScreen> createState() => _VimeoScreenState();
}

class _VimeoScreenState extends State<VimeoScreen> {
  late WebViewController controller;
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    // Configure WebViewController with JavaScript enabled
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Enable JavaScript
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
        Uri.parse('https://www.savethevideo.com/vimeo-downloader'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: GlobalAppBar(
          title: 'Vimeo',
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
