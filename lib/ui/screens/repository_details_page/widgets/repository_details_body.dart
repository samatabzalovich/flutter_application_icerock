import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_icerock/data/repositories/github_repository.dart';
import 'package:flutter_application_icerock/domain/models/repository_model.dart';
import 'package:flutter_application_icerock/ui/common/widgets/custom_progress_indicator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_application_icerock/ui/screens/repository_details_page/widgets/markdown_widget.dart';
import 'package:flutter_application_icerock/ui/common/widgets/text_widget.dart';

import '../../../../data/utils/translation.dart';
import 'custom_markdown.dart';

class RepositoryDetailsBody extends StatelessWidget {
  final RepoModel repo;
  RepositoryDetailsBody({Key? key, required this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding( 
          padding: EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Icon(
                    Icons.link,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: () async {
                          print(await launchUrl(Uri.parse(repo.htmlUrl)));
                        },
                        child: TextWidget(
                          repo.htmlUrl.substring(8),
                          color: Colors.blue,
                          weight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.balance,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TextWidget(
                        translation(context).license,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: TextWidget(repo.license,
                        weight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xffFAD876),
                        size: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      TextWidget(
                        repo.stars.toString(),
                        weight: FontWeight.w500,
                        color: Color(0xffFAD876),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      TextWidget(translation(context).stars),
                    ],
                  ),
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.codeFork,
                        color: Color(0xff6ED370),
                        size: 23,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      TextWidget(
                        repo.forks.toString(),
                        weight: FontWeight.w500,
                        color: Color(0xff6ED370),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      TextWidget(translation(context).forks),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.remove_red_eye,
                        size: 30,
                        color: Color(0xff9CFFF9),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      TextWidget(
                        repo.watchers.toString(),
                        weight: FontWeight.w500,
                        color: Color(0xff9CFFF9),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      TextWidget(translation(context).watchers),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 26,
        ),
        CustomMarkdown(link: repo.mdLink),
      ],
    );
  }
}
