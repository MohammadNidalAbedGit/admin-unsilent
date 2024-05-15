
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {

  Future<bool> get isConnected;
}


class NetworkInfoImpl implements NetworkInfo{
  final InternetConnectionCheckerPlus checker;

  NetworkInfoImpl(this.checker);


  @override
  Future<bool> get isConnected => checker.hasConnection;

}