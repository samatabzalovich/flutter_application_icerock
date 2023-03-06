import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_icerock/ui/common/responsibility/size_config.dart';
import 'package:flutter_application_icerock/ui/screens/login_page/widgets/login_body.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
          child: MediaQuery.of(context).orientation == Orientation.portrait
              ? LoginBody()
              : SingleChildScrollView(child: LoginBody())),
    );
  }
}

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: LoginBody(),
//     );
//   }
// }