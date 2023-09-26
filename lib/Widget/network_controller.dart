import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkController with ChangeNotifier {
  final Connectivity _connectivity = Connectivity();
  late ConnectivityResult connectivityResult = ConnectivityResult.none;

  NetworkController() {
    _initConnectivity();
  }

  Future<void> _initConnectivity() async {
    connectivityResult = await _connectivity.checkConnectivity();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult newResult) {
    if (connectivityResult != newResult) {
      connectivityResult = newResult;
      notifyListeners();
    }
  }

  bool get isOnline => connectivityResult != ConnectivityResult.none;

  // Widget networkHandel(Widget widget) {
  //   if (isOnline) {
  //     return widget;
  //   } else {
  //     return const Center(
  //       child: Text("NO Network Connectivity"),
  //     );
  //   }
  // }
}
