import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dictionary_app/core/services/connectivity_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_provider.g.dart';

@Riverpod(keepAlive: true)
ConnectivityServices connectivityServices(Ref ref) {
  return ConnectivityServices(Connectivity());
}

@Riverpod(keepAlive: true)
Stream<bool> connectivityStream(Ref ref) {
  return ref.watch(connectivityServicesProvider).onConnectivityChanged;
}