import 'package:flutter/material.dart';
import 'package:flutter_application_icerock/domain/models/repository_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_application_icerock/ui/common/widgets/text_widget.dart';
import '../../../../data/utils/translation.dart';
import 'custom_markdown.dart';

class RepositoryDetailsBody extends StatelessWidget {
  final RepoModel repo;
  const RepositoryDetailsBody({Key? key, required this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding( 
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.link,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: () async {
                          await launchUrl(Uri.parse(repo.htmlUrl));
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
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.balance,
                        color: Colors.white,
                      ),
                      const SizedBox(
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
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xffFAD876),
                        size: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      TextWidget(
                        repo.stars.toString(),
                        weight: FontWeight.w500,
                        color: const Color(0xffFAD876),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      TextWidget(translation(context).stars),
                    ],
                  ),
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.codeFork,
                        color: Color(0xff6ED370),
                        size: 23,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      TextWidget(
                        repo.forks.toString(),
                        weight: FontWeight.w500,
                        color:const Color(0xff6ED370),
                      ),
                      const SizedBox(
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
                        color:const Color(0xff9CFFF9),
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
