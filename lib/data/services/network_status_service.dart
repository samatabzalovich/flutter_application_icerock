import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final internetConnection =
    FutureProvider.autoDispose<bool>((ref) {
  final internetConnectionChecker = InternetConnectionChecker();
  return internetConnectionChecker.hasConnection;
});





// final connectivityProvider =
//     StateNotifierProvider.autoDispose<ConnectivityNotifier, ConnectivityStatus>(
//   (ref) {
//     var subs = ref.watch(connectivityStreamProvider);
//     return ConnectivityNotifier(subs.asData);
//   },
// );

// final connectivityStreamProvider =
//     StreamProvider.autoDispose<ConnectivityResult>(
//   (ref) => Connectivity().onConnectivityChanged,
// );

// enum ConnectivityStatus { connected, disconnected }

// class ConnectivityNotifier extends StateNotifier<ConnectivityStatus> {
//   ConnectivityNotifier(Stream<ConnectivityResult> connectivityStream)
//       : super(ConnectivityStatus.disconnected) {
//     connectivityStream.listen((result) {
//       if (result == ConnectivityResult.none) {
//         state = ConnectivityStatus.disconnected;
//       } else {
//         state = ConnectivityStatus.connected;
//       }
//     });
//   }
// }



// class ConnectivityStatusNotifier extends StateNotifier<ConnectivityStatus> {
//   StreamController<ConnectivityResult> controller =
//       StreamController<ConnectivityResult>();

//   ConnectivityStatus? lastResult;
//   ConnectivityStatus? newState;

//   ConnectivityStatusNotifier() : super(ConnectivityStatus.isConnected) {
//     if (state == ConnectivityStatus.isConnected) {
//       lastResult = ConnectivityStatus.isConnected;
//     } else {
//       lastResult = ConnectivityStatus.isDisonnected;
//     }
//     lastResult = ConnectivityStatus.notDetermined;
//     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//       switch (result) {
//         case ConnectivityResult.mobile:
//         case ConnectivityResult.wifi:
//           newState = ConnectivityStatus.isConnected;
//           break;
//         case ConnectivityResult.none:
//           newState = ConnectivityStatus.isDisonnected;
//           break;
//         case ConnectivityResult.ethernet:
//           newState = ConnectivityStatus.isConnected;
//           break;
//       }
//       if (newState != lastResult) {
//         state = newState!;
//         lastResult = newState;
//       }
//     });
//   }
// }

// final connectivityStatusProviders = StateNotifierProvider<ConnectivityStatusNotifier, bool>((ref) {
//   return ConnectivityStatusNotifier();
// });
