import 'package:flutter/cupertino.dart';
import 'package:flutter_application_icerock/ui/screens/login_page/widgets/login_body.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
          child: MediaQuery.of(context).orientation == Orientation.portrait
              ? const LoginBody()
              : const SingleChildScrollView(child: LoginBody())),
    );
  }
}
