
import 'package:captcha_view/painter/captcha_text_painter.dart';
import 'package:flutter/material.dart';

class CaptchView extends StatelessWidget {
  final String input;
  const CaptchView({
    super.key,
    required this.input,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: 160, // Set the width of the container
            height: 10, // Set the height of the container
            child: CustomPaint(
              painter: CaptchaTextPainter(input),
            ),
          );
  }
}