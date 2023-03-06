import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final double strokeWidth;
  CustomCircularProgressIndicator({super.key, this.strokeWidth = 4});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: Colors.white,
      strokeWidth: strokeWidth,
    );
  }
}
