import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../controller/controller.dart';
import '../../global/constants/colors_resources.dart';
import '../../global/widget/global_app_bar.dart';
import '../../global/widget/global_progress_hub.dart';

class EpoxyFlooringScreen extends StatefulWidget {
  const EpoxyFlooringScreen({super.key});

  @override
  State<EpoxyFlooringScreen> createState() => _EpoxyFlooringScreenState();
}

class _EpoxyFlooringScreenState extends State<EpoxyFlooringScreen> {
  late WebViewController controller;
  int loadingPercentage = 0;
  bool isOffline = false;
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initializeWebView();
    checkConnectivity();
  }

  @override
  void dispose() {
    connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      isOffline = connectivityResult.contains(ConnectivityResult.none);
    });

    // Listen for connectivity changes
    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      if (mounted) {
        setState(() {
          isOffline = results.contains(ConnectivityResult.none);
        });

        if (!isOffline) {
          controller
              .reload(); // Reload the page when the connection is restored
        }
      }
    }) as StreamSubscription<ConnectivityResult>;
  }

  void initializeWebView() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          if (!isOffline) {
            Provider.of<WebViewLoadingController>(context, listen: false)
                .isLoading = true;
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
          Provider.of<WebViewLoadingController>(context, listen: false)
              .isLoading = false;
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
      ..loadRequest(Uri.parse(
          'https://kaltiengineering.com/epoxy-flooring-in-bangladesh/'));
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
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              checkConnectivity();
              if (!isOffline) {
                controller.reload();
              }
            },
            child:
                Text('Retry', style: TextStyle(color: ColorRes.primaryColor)),
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
          title: 'Epoxy Flooring Solution',
        ),
      ),
      body: Consumer<WebViewLoadingController>(
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
                if (loadingPercentage < 100 && !isOffline)
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
