import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final double height;
  final TextOverflow overflow;
  final TextAlign alignment;
  const TextWidget(this.text,
      {Key? key,
      this.size = 16,
      this.color = Colors.white,
      this.weight = FontWeight.normal,
      this.height = 0,
      this.overflow = TextOverflow.visible,  this.alignment = TextAlign.left})
      : super(key: key);
  double lineHeight(double height) {
    if (height == 0) {
      return 1.0;
    }
    return height / size;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines:overflow == TextOverflow.visible ? 5 : 1,
      textAlign: alignment,
      overflow: overflow,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
        height: lineHeight(height),
      ),
    );
  }
}
