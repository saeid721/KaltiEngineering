import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../controller/controller.dart';
import '../../global/widget/global_app_bar.dart';
import '../../global/widget/global_progress_hub.dart';
class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  late final WebViewController controller;
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();

    // Initialize WebViewController
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          // Update the loading state in the controller
          Provider.of<LoadingController>(context, listen: false).isLoading = true;
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
          // Once the page is finished loading, update the controller state
          Provider.of<LoadingController>(context, listen: false).isLoading = false;
          setState(() {
            loadingPercentage = 100;
          });

          // Inject CSS to hide header/footer after the page is loaded
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
          if (request.url.contains("header") || request.url.contains("footer")) {
            return NavigationDecision.prevent; // Block header/footer network requests
          }
          return NavigationDecision.navigate;
        },
      ))
      ..loadRequest(Uri.parse('https://kaltiengineering.com/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: GlobalAppBar(
          title: 'Kalti Engineering',
        ),
      ),
      body: Consumer<LoadingController>(builder: (context, loadingController, child) {
        return ProgressHUD(
          inAsyncCall: loadingController.isLoading, // Use the controller's isLoading state
          child: Stack(
            children: [
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
      }),
    );
  }
}
