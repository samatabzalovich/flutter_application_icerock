import 'package:flutter/cupertino.dart';
import 'package:flutter_application_icerock/domain/models/repository_model.dart';
import 'package:flutter_application_icerock/ui/common/widgets/navbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/repository_details_body.dart';

class RepositoryDetailsPage extends ConsumerWidget {
  static const routeName = '/repo-details';
  final RepoModel repo;
  const RepositoryDetailsPage({super.key, required this.repo});

  @override
  Widget build(BuildContext context ,WidgetRef ref) {
    return CupertinoPageScaffold(
      navigationBar: createNavBar(title: repo.name,ref: ref,isBackPageExists: true, context: context),
      child: MediaQuery.of(context).orientation == Orientation.portrait ? RepositoryDetailsBody(repo: repo,) :SingleChildScrollView(child: RepositoryDetailsBody(repo: repo,),),
    );
  }
}
