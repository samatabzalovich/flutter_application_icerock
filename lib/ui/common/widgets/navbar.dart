import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_icerock/data/repositories/auth_repository.dart';
import 'package:flutter_application_icerock/ui/screens/login_page/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

CupertinoNavigationBar createNavBar(
    {required String title,
    required BuildContext context,
    required WidgetRef ref,
    bool isBackPageExists = false}) {
  return CupertinoNavigationBar(
    padding: EdgeInsetsDirectional.zero,
    backgroundColor:const Color(0xFF0D1117),
    leading: isBackPageExists
        ? CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child:const Icon(
              Icons.arrow_back_ios_new,
              size: 28,
            ),
          )
        : null,
    border: const Border(bottom: BorderSide(color: Color(0xff21262D))),
    // centerTitle: false,
    middle: Text(
      title,
      style:const TextStyle(color: CupertinoColors.white, fontSize: 17),
    ),
    trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () async {
          var nav = Navigator.of(context);
          await ref.read(authRepositoryProvider.notifier).signOut();
          nav.pushNamedAndRemoveUntil(LoginPage.routeName, (route) => false);
        },
        child: const Icon(
          Icons.input,
          color: CupertinoColors.white,
        )),
  );
}
