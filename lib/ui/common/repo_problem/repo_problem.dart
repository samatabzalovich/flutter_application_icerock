import 'package:flutter/cupertino.dart';
import 'package:flutter_application_icerock/data/utils/translation.dart';
import 'package:flutter_application_icerock/ui/common/widgets/default_button.dart';
import 'package:flutter_application_icerock/ui/common/widgets/text_widget.dart';
import 'package:flutter_svg/svg.dart';

class RepoProblem extends StatefulWidget {
  final String errorType;
  final VoidCallback onpress;
  const RepoProblem(
      {super.key, required this.errorType, required this.onpress});

  @override
  State<RepoProblem> createState() => _RepoProblemState();
}

class _RepoProblemState extends State<RepoProblem> {
  
  @override
  Widget build(BuildContext context) {
    Map<String, List<dynamic>> widgets = {
    "con": [
      translation(context).retry,
      SvgPicture.asset('assets/images/conn.svg'),
      TextWidget(
        translation(context).conTitle,
        alignment: TextAlign.center,
        height: 28,
        color: const Color(0xffCB4F4F),
      ),
      TextWidget(
        translation(context).conSubtitle,
        size: 14,
        height: 20,
        alignment: TextAlign.center,
      ),
    ],
    "load": [
      translation(context).retry,
      Padding(
        padding: const EdgeInsets.only(top: 100),
        child: SvgPicture.asset('assets/images/conn.svg'),
      ),
      TextWidget(
        translation(context).loadTitle,
        alignment: TextAlign.center,
        height: 28,
        color: const Color(0xffCB4F4F),
      ),
      TextWidget(
        translation(context).conSubtitle,
        size: 14,
        height: 20,
        alignment: TextAlign.center,
      ),
    ],
    "empty": [
      translation(context).refresh,
      SvgPicture.asset('assets/images/Empty.svg'),
      TextWidget(
        translation(context).emptyTitle,
        alignment: TextAlign.center,
        height: 28,
        color: const Color(0xff58A6FF),
      ),
      TextWidget(
        translation(context).emptySubtitle,
        size: 14,
        height: 20,
        alignment: TextAlign.center,
      ),
    ],
    "error": [
      translation(context).retry,
      SvgPicture.asset('assets/images/error.svg'),
      TextWidget(
        translation(context).somethingErrorTitle,
        alignment: TextAlign.center, height: 28,
        color: const Color(0xffCB4F4F),
      ),
      TextWidget(
        translation(context).somethingErrorSubtitle,
        size: 14,
        height: 20,
        alignment: TextAlign.center,
      ),
    ]
  };
    return Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Expanded(
      child: Align(
        alignment: widget.errorType== 'load'? Alignment.topCenter : Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            widgets[widget.errorType]![1],
            const SizedBox(height: 24),
            widgets[widget.errorType]![2],
            widgets[widget.errorType]![3]
          ],
        ),
      ),
    ),
    DefaultButton(
      onPressedAction: widget.onpress,
      name: widgets[widget.errorType]![0],
      isLoading: false
    )
  ],
);
  }
}
