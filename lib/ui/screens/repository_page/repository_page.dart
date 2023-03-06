import 'package:flutter/cupertino.dart';
import 'package:flutter_application_icerock/data/utils/translation.dart';
import 'package:flutter_application_icerock/ui/screens/repository_page/widgets/repo_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/widgets/navbar.dart';

class RepositoryPage extends ConsumerWidget {
  static const String routeName = '/repo-page';
  const RepositoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      navigationBar: createNavBar(title: translation(context).repositories,ref: ref, context: context),
      child:const RepoBody(),
    );
  }
}
