import 'package:flutter/cupertino.dart';
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
  Map<String, List<dynamic>> widgets = {
    "con": [
      'Retry',
      SvgPicture.asset('assets/images/conn.svg'),
      TextWidget(
        'Connection error',
        alignment: TextAlign.center,
        height: 28,
        color: const Color(0xffCB4F4F),
      ),
      TextWidget(
        'Check your Internet connection',
        size: 14,
        height: 20,
        alignment: TextAlign.center,
      ),
    ],
    "load": [
      'Retry',
      Padding(
        padding: EdgeInsets.only(top: 100),
        child: SvgPicture.asset('assets/images/conn.svg'),
      ),
      TextWidget(
        'Load error',
        alignment: TextAlign.center,
        height: 28,
        color: const Color(0xffCB4F4F),
      ),
      TextWidget(
        'Check your Internet connection',
        size: 14,
        height: 20,
        alignment: TextAlign.center,
      ),
    ],
    "empty": [
      'Refresh',
      SvgPicture.asset('assets/images/Empty.svg'),
      TextWidget(
        'Empty',
        alignment: TextAlign.center,
        height: 28,
        color: const Color(0xff58A6FF),
      ),
      TextWidget(
        'No repositories at the moment',
        size: 14,
        height: 20,
        alignment: TextAlign.center,
      ),
    ],
    "error": [
      'Retry',
      SvgPicture.asset('assets/images/error.svg'),
      TextWidget(
        'Something Error',
        alignment: TextAlign.center, height: 28,
        color: const Color(0xffCB4F4F),
      ),
      TextWidget(
        'Check your something',
        size: 14,
        height: 20,
        alignment: TextAlign.center,
      ),
    ]
  };
  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 24),
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
