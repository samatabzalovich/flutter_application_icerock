import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_icerock/ui/common/widgets/text_widget.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Dialog(
        elevation: 0,
        backgroundColor:const Color(0xff0D1117), // your color
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        child: SizedBox(
          height: 141,
          width: 270,
          child: Column(
            children: [
              Container(
                padding:const EdgeInsets.symmetric(vertical: 16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xff21262D), width: 1),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Center(
                      child: TextWidget('Error', size: 17,weight: FontWeight.w600,)
                    ),
                    SizedBox(height: 8,),
                    Center(
                      child: TextWidget('Error data / error code\ninformation for developers', size: 13,height: 18, alignment: TextAlign.center, overflow: TextOverflow.visible,),
                    ),
                  ],
                ),
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.of(context)
                      .pop(); // replace with your own functions
                },
                child: const Center(child: TextWidget('Ok', size: 17,weight: FontWeight.w600, color:  Color(0xff58A6FF),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

