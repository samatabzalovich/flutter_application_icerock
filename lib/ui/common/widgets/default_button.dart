import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_icerock/ui/common/widgets/custom_progress_indicator.dart';
import 'package:flutter_application_icerock/ui/common/widgets/text_widget.dart';

class DefaultButton extends StatefulWidget {
  final bool isFocused;
  final bool isLoading;
  final VoidCallback onPressedAction;
  final String name;
  const DefaultButton(
      {super.key,
      required this.onPressedAction,
      required this.name,
      this.isFocused = false, required this.isLoading});

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          horizontal: 16, vertical: MediaQuery.of(context).orientation == Orientation.portrait ? widget.isFocused ? 18 : 36 : 45),
      child: CupertinoButton(
        // style: ElevatedButton.styleFrom(backgroundColor: ),
        color: Color(0xff5A9357),
        onPressed: widget.onPressedAction,
        child: Visibility(visible: !widget.isLoading, replacement:   SizedBox(width: 24,child: CustomCircularProgressIndicator()), child: TextWidget(widget.name, weight: FontWeight.w600,),),
      ),
    );
  }
}
// class DefaultButton extends StatefulWidget {
//   final bool isFocused;
//   final bool isLoading;
//   final VoidCallback onPressedAction;
//   final String name;
//   const DefaultButton(
//       {super.key,
//       required this.onPressedAction,
//       required this.name,
//       this.isFocused = false, required this.isLoading});

//   @override
//   State<DefaultButton> createState() => _DefaultButtonState();
// }

// class _DefaultButtonState extends State<DefaultButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 6.h,
//       width: double.infinity,
//       margin: EdgeInsets.symmetric(
//           horizontal: 4.26.w, vertical: widget.isFocused ? 3.1.h : 6.2.h),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(backgroundColor: Color(0xff5A9357)),
//         onPressed: widget.onPressedAction,
//         child: Visibility(visible: !widget.isLoading, replacement:  const SizedBox(width: 24, height: 24,child: CustomProgressIndicator()), child: TextWidget(widget.name),),
//       ),
//     );
//   }
// }
