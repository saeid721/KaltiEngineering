// import 'package:flutter/material.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import '../../global/constants/colors_resources.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:provider/provider.dart';
// import '../../controller/controller.dart';
//
// class NoConnectionMessage extends StatelessWidget {
//   final Function onRetry;
//
//   const NoConnectionMessage({super.key, required this.onRetry});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.signal_wifi_off,
//             size: 64,
//             color: Colors.grey[600],
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'No Internet Connection',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey[800],
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Please check your internet connection and try again',
//             style: TextStyle(
//               color: Colors.grey[600],
//             ),
//           ),
//           const SizedBox(height: 24),
//           ElevatedButton(
//             onPressed: () async {
//               // Check connectivity when retry is pressed
//               var connectivityResult = await Connectivity().checkConnectivity();
//
//               // Trigger the retry callback with the connection status
//               onRetry(connectivityResult);
//             },
//             child: Text('Retry', style: TextStyle(color: ColorRes.primaryColor)),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
// class EpoxyFlooringWebView extends StatefulWidget {
//   final String url;  // Add the URL as a parameter
//
//   const EpoxyFlooringWebView({super.key, required this.url});
//
//   @override
//   State<EpoxyFlooringWebView> createState() => _EpoxyFlooringWebViewState();
// }
//
// class _EpoxyFlooringWebViewState extends State<EpoxyFlooringWebView> {
//   late WebViewController controller;
//   int loadingPercentage = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     initializeWebView();
//   }
//
//   void initializeWebView() {
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(NavigationDelegate(
//         onPageStarted: (url) {
//           Provider.of<WebViewLoadingController>(context, listen: false)
//               .isLoading = true;
//           setState(() {
//             loadingPercentage = 0;
//           });
//         },
//         onProgress: (progress) {
//           setState(() {
//             loadingPercentage = progress;
//           });
//         },
//         onPageFinished: (url) {
//           Provider.of<WebViewLoadingController>(context, listen: false)
//               .isLoading = false;
//           setState(() {
//             loadingPercentage = 100;
//           });
//
//           controller.runJavaScript("""
//             (function() {
//               var css = document.createElement('style');
//               css.innerHTML = `
//                 header, .home-page-header, #header,
//                 footer, .site-footer, #footer,
//                 .hidden-header, .hidden-footer {
//                   display: none !important;
//                   visibility: hidden !important;
//                   height: 0px !important;
//                   overflow: hidden !important;
//                 }
//               `;
//               document.head.appendChild(css);
//             })();
//           """);
//         },
//         onNavigationRequest: (request) {
//           if (request.url.contains("header") || request.url.contains("footer")) {
//             return NavigationDecision.prevent;
//           }
//           return NavigationDecision.navigate;
//         },
//       ))
//       ..loadRequest(Uri.parse(widget.url));  // Use the URL passed to the widget
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WebViewWidget(controller: controller);
//   }
// }
