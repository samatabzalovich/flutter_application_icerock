import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final internetConnection =
    FutureProvider.autoDispose<bool>((ref) {
  final internetConnectionChecker = InternetConnectionChecker();
  return internetConnectionChecker.hasConnection;
});


