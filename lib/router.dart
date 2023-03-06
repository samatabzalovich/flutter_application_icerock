import 'package:flutter/material.dart';
import 'package:flutter_application_icerock/domain/models/repository_model.dart';
import 'package:flutter_application_icerock/ui/screens/login_page/login_page.dart';
import 'package:flutter_application_icerock/ui/screens/repository_details_page/repository_details_page.dart';
import 'package:flutter_application_icerock/ui/screens/repository_page/repository_page.dart';

import 'data/utils/translation.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>const LoginPage(),
      );
    case RepositoryPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const RepositoryPage());
    case RepositoryDetailsPage.routeName:
      RepoModel repo = routeSettings.arguments as RepoModel;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => RepositoryDetailsPage(
          repo: repo,
        ),
      );
    default:
      return MaterialPageRoute(
          builder: (c) => Scaffold(
                body: Center(
                  child: Text(translation(c).pageNotFound),
                ),
              ));
  }
}
