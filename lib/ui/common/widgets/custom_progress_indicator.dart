import 'dart:math';

import 'package:flutter/cupertino.dart';

class CustomCircularProgressIndicator extends StatefulWidget {
  final double size;
  final Color color;
  final double strokeWidth;

  CustomCircularProgressIndicator({
    this.size = 24,
    this.color = CupertinoColors.white,
    this.strokeWidth = 4,
  });

  @override
  _CustomCircularProgressIndicatorState createState() =>
      _CustomCircularProgressIndicatorState();
}

class _CustomCircularProgressIndicatorState
    extends State<CustomCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return Transform.rotate(
            angle: _animationController.value * 2* pi,
            child: Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: _CircularProgressPainter(
                      value: _animationController.value,
                      color: widget.color,
                      strokeWidth: widget.strokeWidth,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
class _CircularProgressPainter extends CustomPainter {
  final double value;
  final Color color;
  final double strokeWidth;

  _CircularProgressPainter({
    required this.value,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Paint bgPaint = Paint()
      ..color = CupertinoColors.systemGrey.withOpacity(0.2)
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double radius = size.shortestSide / 2 - strokeWidth / 2;

    canvas.drawCircle(
      size.center(Offset.zero),
      radius,
      bgPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: radius),
      -pi / 2,
      value * 2 * pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_CircularProgressPainter oldDelegate) =>
      oldDelegate.value != value;
}
// class CustomProgressIndicator extends StatelessWidget {
//   const CustomProgressIndicator({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoActivityIndicator(color: Colors.white,);
//   }
// }
// class CustomProgressIndicator extends StatelessWidget {
//   const CustomProgressIndicator({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CircularProgressIndicator(color: Colors.white,);
//   }
// }