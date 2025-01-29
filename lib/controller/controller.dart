import 'package:flutter/material.dart';

class WebViewLoadingController with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners(); // Notify the UI to rebuild
  }
}
