import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart'; // Import provider package
import '../../controller/controller.dart';
import '../../global/widget/global_app_bar.dart';
import '../../global/widget/global_progress_hub.dart';

class ConstructionChemicalsScreen extends StatefulWidget {
  const ConstructionChemicalsScreen({super.key});

  @override
  State<ConstructionChemicalsScreen> createState() => _ConstructionChemicalsScreenState();
}

class _ConstructionChemicalsScreenState extends State<ConstructionChemicalsScreen> {
  late WebViewController controller;
  int loadingPercentage = 0;
  bool isOffline = false;

  @override
  void initState() {
    super.initState();
    initializeWebView();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Check if the device has an active internet connection
  Future<void> checkConnectivity() async {
    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isOffline = true;
      } else {
        isOffline = false;
      }
    }
  }

  void initializeWebView() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) async {
          if (!isOffline) {
            Provider.of<LoadingController>(context, listen: false).isLoading =
            true;
            setState(() {
              loadingPercentage = 0;
            });
          }
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          Provider.of<LoadingController>(context, listen: false).isLoading =
          false;
          setState(() {
            loadingPercentage = 100;
          });

          controller.runJavaScript("""
            (function() {
              var css = document.createElement('style');
              css.innerHTML = `
                header, .home-page-header, #header, 
                footer, .site-footer, #footer, 
                .hidden-header, .hidden-footer {
                  display: none !important;
                  visibility: hidden !important;
                  height: 0px !important;
                  overflow: hidden !important;
                }
              `;
              document.head.appendChild(css);
            })();
          """);
        },
        onNavigationRequest: (request) {
          if (request.url.contains("header") ||
              request.url.contains("footer")) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
        onWebResourceError: (WebResourceError error) {
          setState(() {
            isOffline = true;
          });
        },
      ))
      ..loadRequest(Uri.parse('https://kaltiengineering.com/construction-chemicals-in-bangladesh/'));
  }

  Widget buildOfflineMessage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.signal_wifi_off,
            size: 64,
            color: Colors.grey[600],
          ),
          const SizedBox(height: 16),
          Text(
            'No Internet Connection',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Please check your internet connection and try again',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: GlobalAppBar(
          title: 'Construction Chemicals',
        ),
      ),
      body: Consumer<LoadingController>(
        builder: (context, loadingController, child) {
          return ProgressHUD(
            inAsyncCall: loadingController.isLoading,
            child: Stack(
              children: [
                if (isOffline)
                  buildOfflineMessage()
                else
                  WebViewWidget(
                    controller: controller,
                  ),
                if (loadingPercentage < 100)
                  LinearProgressIndicator(
                    color: Colors.red,
                    value: loadingPercentage / 100.0,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

