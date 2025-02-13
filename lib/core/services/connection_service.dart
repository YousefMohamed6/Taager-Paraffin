import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectionProvider with ChangeNotifier {
  late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;
  List<ConnectivityResult> connectionStatus = [ConnectivityResult.none];
  final Connectivity connectivity = Connectivity();
  late List<ConnectivityResult> result;

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    connectionStatus = result;
    notifyListeners();
    debugPrint('Connectivity changed: $connectionStatus');
  }

  Future<void> listenToConnection() async {
    result = await connectivity.checkConnectivity();
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    connectivitySubscription.cancel();
    super.dispose();
  }
}
