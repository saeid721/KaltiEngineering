// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
//
// class ConnectivityProvider with ChangeNotifier {
//   bool _isOffline = false;
//   late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
//
//   bool get isOffline => _isOffline;
//
//   ConnectivityProvider() {
//     _checkConnectivity();
//     _connectivitySubscription = Connectivity()
//         .onConnectivityChanged
//         .listen((List<ConnectivityResult> results) {
//       _isOffline = results.contains(ConnectivityResult.none);
//       notifyListeners();
//     });
//   }
//
//   Future<void> _checkConnectivity() async {
//     var connectivityResult = await Connectivity().checkConnectivity();
//     _isOffline = connectivityResult.contains(ConnectivityResult.none);
//     notifyListeners();
//   }
//
//   @override
//   void dispose() {
//     _connectivitySubscription.cancel();
//     super.dispose();
//   }
// }
