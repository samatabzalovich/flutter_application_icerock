import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/repositories/auth_repository.dart';
import '../../../../data/repositories/github_repository.dart';
import '../../../../data/services/network_status_service.dart';
import '../../../../data/utils/translation.dart';
import '../../../common/repo_problem/repo_problem.dart';
import '../../../common/widgets/custom_progress_indicator.dart';
import '../../../common/widgets/text_widget.dart';
import 'markdown_widget.dart';

class CustomMarkdown extends ConsumerStatefulWidget {
  const CustomMarkdown({
    super.key,
    required this.link,
  });

  final String link;

  @override
  ConsumerState<CustomMarkdown> createState() => _CustomMarkdownState();
}

class _CustomMarkdownState extends ConsumerState<CustomMarkdown> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ref.read(internetConnection.future),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
            if(snapshot.hasData){
              if(snapshot.data!){
                return FutureBuilder(
            future: ref.read(githubRepositoryProvider).getMarkDownFile(widget.link),
            builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
              if (ConnectionState.waiting == snapshot.connectionState) {
                return Center(child: CustomCircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Expanded(
                  child: RepoProblem(
                      errorType: 'load',
                      onpress: () {
                        setState(() {});
                      }),
                );
              }
              if (snapshot.hasData) {
                return MediaQuery.of(context).orientation == Orientation.portrait ? Expanded(
                    child: MarkDownWidget(markdownData: snapshot.data!)) : MarkDownWidget(markdownData: snapshot.data!);
              } else {
                return Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: TextWidget(
                      translation(context).noReadme,
                      color: Colors.white.withOpacity(0.7),
                    ));
              }
            });
              }else {
                return Expanded(
                  child: RepoProblem(
                      errorType: 'load',
                      onpress: () {
                        setState(() {});
                      }),
                );
              }
            }
            return Center(child: CustomCircularProgressIndicator());
      }
    );
  }
}
