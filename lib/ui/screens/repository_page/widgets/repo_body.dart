import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_application_icerock/data/repositories/github_repository.dart';
import 'package:flutter_application_icerock/data/services/network_status_service.dart';
import 'package:flutter_application_icerock/domain/models/repository_model.dart';
import 'package:flutter_application_icerock/ui/common/widgets/custom_progress_indicator.dart';
import 'package:flutter_application_icerock/ui/common/widgets/text_widget.dart';
import 'package:flutter_application_icerock/ui/screens/login_page/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/repositories/auth_repository.dart';
import '../../../common/repo_problem/repo_problem.dart';
import 'clickable_list_tile.dart';

class RepoBody extends ConsumerStatefulWidget {
  const RepoBody({super.key});

  @override
  ConsumerState<RepoBody> createState() => _RepoBodyState();
}

class _RepoBodyState extends ConsumerState<RepoBody> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ref.read(internetConnection.future),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!) {
              return FutureBuilder(
                  future: ref
                      .read(githubRepositoryProvider)
                      .getRepositoriesForUser(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<RepoModel>?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: Container(width: 56, height: 56,child: CustomCircularProgressIndicator(strokeWidth: 7,)));
                    }
                    if (snapshot.hasError) {
                      String errorMessage = snapshot.error.toString();
                      if (errorMessage.contains('internet')) {
                        return RepoProblem(
                            errorType: 'con',
                            onpress: () {
                              setState(() {});
                            });
                      } else if (errorMessage.contains('NotFoundToken')) {
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              LoginPage.routeName, (route) => false);
                        });
                      } else {
                        return RepoProblem(
                            errorType: 'error',
                            onpress: () {
                              setState(() {});
                            });
                      }
                    }
                    if (snapshot.hasData) {
                      if (snapshot.data!.isNotEmpty) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ClickableListTile(
                                repo: snapshot.data![index]);
                          },
                        );
                      } else {
                        return RepoProblem(
                            errorType: 'empty',
                            onpress: () {
                              setState(() {});
                            });
                      }
                    } else {
                      return RepoProblem(
                          errorType: 'error',
                          onpress: () {
                            setState(() {});
                          });
                    }
                  });
            } else {
              return RepoProblem(
                  errorType: 'con',
                  onpress: () async {
                    setState(() {});
                  });
            }
          }
          return Center(child: Container(width: 56, height: 56,child: CustomCircularProgressIndicator(strokeWidth: 7,)));
        });
  }
}
