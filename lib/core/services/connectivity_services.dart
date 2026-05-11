import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityServices {
  final Connectivity _connectivity;

  ConnectivityServices(this._connectivity);

  bool _hasConnection(List<ConnectivityResult> results) {
    return results.any((result) => result != ConnectivityResult.none);
  }

  /// Emits current state first, then updates on every network change.
  Stream<bool> get onConnectivityChanged async* {
    yield await isOnline();
    yield* _connectivity.onConnectivityChanged.map(_hasConnection).distinct();
  }

  /// CURRENT STATUS (one-time check)
  Future<bool> isOnline() async {
    final results = await _connectivity.checkConnectivity();
    return _hasConnection(results);
  }
}