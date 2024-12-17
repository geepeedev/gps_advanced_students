import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:fpdart/fpdart.dart';

class InternetChecker {
  final Connectivity _connectivity;

  InternetChecker({
    required Connectivity connectivity,
  }) : _connectivity = connectivity;

  Stream<List<ConnectivityResult>> get checkInternet =>
      _connectivity.onConnectivityChanged;

 Future<List<ConnectivityResult>> checkInternetFuture() => _connectivity.checkConnectivity();
}
