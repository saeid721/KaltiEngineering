import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../global/constants/colors_resources.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final WebViewController? controller; // Make it optional
  final VoidCallback onHomePressed;

  const CustomBottomNavigationBar({
    super.key,
    this.controller, // Optional parameter
    required this.onHomePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: ColorRes.primaryColor.withAlpha((0.10 * 255).toInt()),
        border: Border(
          top: BorderSide(width: .5, color: ColorRes.primaryColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: ColorRes.primaryColor),
                onPressed: () async {
                  if (controller != null) { // Check if controller is not null
                    final messenger = ScaffoldMessenger.of(context);
                    if (await controller!.canGoBack()) {
                      await controller!.goBack();
                    } else {
                      messenger.showSnackBar(
                        const SnackBar(
                          duration: Duration(milliseconds: 200),
                          content: Text(
                            'Can\'t go back',
                            style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }
                  }
                },
              ),
              // You can uncomment and handle forward or reload buttons similarly if needed
              // IconButton(
              //   icon: const Icon(Icons.arrow_forward_ios),
              //   onPressed: () async {
              //     if (controller != null) {
              //       final messenger = ScaffoldMessenger.of(context);
              //       if (await controller!.canGoForward()) {
              //         await controller!.goForward();
              //       } else {
              //         messenger.showSnackBar(
              //           const SnackBar(
              //             duration: Duration(milliseconds: 200),
              //             content: Text(
              //               'No forward history item',
              //               style: TextStyle(
              //                   fontSize: 20, fontWeight: FontWeight.bold),
              //             ),
              //           ),
              //         );
              //       }
              //     }
              //   },
              // ),
              // IconButton(
              //   icon: const Icon(Icons.replay),
              //   onPressed: () {
              //     controller?.reload();
              //   },
              // ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.home, color: ColorRes.primaryColor, size: 30),
            onPressed: onHomePressed,
          ),
        ],
      ),
    );
  }
}
