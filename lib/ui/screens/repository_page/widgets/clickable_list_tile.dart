import 'package:flutter/cupertino.dart';
import 'package:flutter_application_icerock/domain/models/repository_model.dart';
import 'package:flutter_application_icerock/ui/screens/repository_details_page/repository_details_page.dart';

import '../../../common/widgets/text_widget.dart';

class ClickableListTile extends StatelessWidget {
  const ClickableListTile({
    super.key,
    required this.repo,
  });

  final RepoModel repo;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.of(context)
            .pushNamed(RepositoryDetailsPage.routeName, arguments: repo);
      },
      child: Container(
        padding: EdgeInsets.only(top: 14, bottom: 16),
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Color(0xff21262D)))),
        child: CupertinoListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                repo.name,
                color: const Color(0xff58A6FF),
                size: 16,
                weight: FontWeight.w400,
              ),
              TextWidget(
                repo.language,
                color: Color(repo.languageColor),
                size: 12,
              ),
            ],
          ),
          subtitle: repo.description.isEmpty
              ? Container()
              : SizedBox(
                  child: TextWidget(
                    repo.description,
                    color: CupertinoColors.white,
                    size: 14,
                    height: 20,
                  ),
                ),
        ),
      ),
    );
  }
}
