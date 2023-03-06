

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkDownWidget extends StatelessWidget {
  const MarkDownWidget({
    super.key,
    required this.markdownData,
  });

  final String markdownData;
  @override
  Widget build(BuildContext context) {
    return Markdown(
      physics: MediaQuery.of(context).orientation == Orientation.portrait ?const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
      // builders: ,
      shrinkWrap: MediaQuery.of(context).orientation == Orientation.portrait ? false : true,
      imageBuilder: (uri, title, alt) => const SizedBox.shrink(),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      styleSheet: MarkdownStyleSheet(
          listBullet: TextStyle(color: Colors.white.withOpacity(0.7)),
          h1: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          h2: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          h3: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          p: TextStyle(
            fontSize: 16,
            color: Colors.white.withOpacity(0.7),
          )),
      data: markdownData,
    );
  }
}
