import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_icerock/data/utils/translation.dart';
import 'package:flutter_application_icerock/ui/common/repo_problem/repo_problem.dart';
import 'package:flutter_application_icerock/ui/screens/repository_page/widgets/repo_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/widgets/navbar.dart';

class RepositoryPage extends ConsumerWidget {
  static const String routeName = '/repo-page';
  const RepositoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(MediaQuery.of(context).size.width.toString() +
        " " +
        MediaQuery.of(context).size.height.toString());
    return CupertinoPageScaffold(
      navigationBar: createNavBar(title: translation(context).repositories,ref: ref, context: context),
      child: RepoBody(),
    );
  }
}
