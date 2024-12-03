
import 'dart:math';

import 'package:flutter/material.dart';

class CaptchaTextPainter extends CustomPainter {
  final String text;
  CaptchaTextPainter(this.text);

  final Random _random = Random();

  @override
  void paint(Canvas canvas, Size size) {
    // Paint paint = Paint()
    //   ..color = Colors.blue
    //   ..strokeWidth = 3j
    //   ..style = PaintingStyle.stroke;

    double startX = 0;
    double startY = size.height / 2;

    double stepWidth = size.width / text.length; // Divide width by the number of characters
    double amplitude = 5; // Amplitude of the zigzag

    for (int i = 0; i < text.length; i++) {
      // Random rotation angle between -45 and 45 degrees
      double rotationAngle = (_random.nextDouble() - 0.5) * pi / 2; // Random angle between -π/4 and π/4

      // Random vertical offset for each character to create the "zigzag" effect
      double yOffset = (i % 2 == 0) ? startY - amplitude : startY + amplitude;

      // Create a transform matrix for rotation and positioning
      canvas.save(); // Save the current state of the canvas

      // Apply translation and rotation
      canvas.translate(startX + i * stepWidth, yOffset);
      canvas.rotate(rotationAngle);

      // Draw the text character at the transformed position
      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: text[i],
          style: const TextStyle(fontSize: 24, color: Colors.black),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      textPainter.paint(canvas, Offset.zero); // Paint at the current transformed position

      canvas.restore(); // Restore the canvas state to the previous one
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; // No need to repaint unless text changes
  }
}
