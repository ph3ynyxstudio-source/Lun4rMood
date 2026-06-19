import 'package:flutter/material.dart';

import '../theme/app_gradients.dart';

class StarryBackground extends StatelessWidget {
  const StarryBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(gradient: AppGradients.background),
      child: CustomPaint(
        painter: const _StarryBackgroundPainter(),
        child: child,
      ),
    );
  }
}

class _StarryBackgroundPainter extends CustomPainter {
  const _StarryBackgroundPainter();

  static const List<_StarPoint> _stars = [
    _StarPoint(0.08, 0.12, 0.9, 0.20),
    _StarPoint(0.18, 0.32, 0.7, 0.16),
    _StarPoint(0.27, 0.18, 1.1, 0.18),
    _StarPoint(0.39, 0.08, 0.6, 0.14),
    _StarPoint(0.48, 0.28, 0.9, 0.16),
    _StarPoint(0.58, 0.14, 1.2, 0.20),
    _StarPoint(0.72, 0.24, 0.8, 0.15),
    _StarPoint(0.84, 0.10, 1.0, 0.18),
    _StarPoint(0.93, 0.36, 0.7, 0.14),
    _StarPoint(0.12, 0.58, 1.0, 0.16),
    _StarPoint(0.31, 0.48, 0.6, 0.13),
    _StarPoint(0.43, 0.72, 1.1, 0.17),
    _StarPoint(0.64, 0.56, 0.7, 0.15),
    _StarPoint(0.76, 0.82, 1.0, 0.16),
    _StarPoint(0.90, 0.66, 0.8, 0.14),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (final star in _stars) {
      paint.color = Color.fromRGBO(255, 255, 255, star.opacity);
      canvas.drawCircle(
        Offset(star.dx * size.width, star.dy * size.height),
        star.radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _StarryBackgroundPainter oldDelegate) => false;
}

class _StarPoint {
  const _StarPoint(this.dx, this.dy, this.radius, this.opacity);

  final double dx;
  final double dy;
  final double radius;
  final double opacity;
}
