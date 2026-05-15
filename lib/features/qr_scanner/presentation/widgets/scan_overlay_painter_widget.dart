import 'package:flutter/material.dart';

class ScanOverlayPainter extends CustomPainter {
  final double cutoutSize;
  final Color borderColor;
  final double borderWidth;
  final double cornerLength;
  final Color overlayColor;
  final double animationValue; // 0.0 → 1.0 for scan line

  const ScanOverlayPainter({
    required this.cutoutSize,
    required this.animationValue,
    this.borderColor = const Color(0xFF00E5FF),
    this.borderWidth = 2.5,
    this.cornerLength = 24,
    this.overlayColor = const Color(0xBB000000),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final half = cutoutSize / 2;

    final cutout = Rect.fromCenter(
      center: Offset(cx, cy),
      width: cutoutSize,
      height: cutoutSize,
    );

    // Dark overlay with cutout
    final overlayPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRect(cutout)
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(
      overlayPath,
      Paint()..color = overlayColor,
    );

    // Corner brackets — pixel precise, no radius
    final borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    final corners = [
      // Top-left
      [Offset(cx - half, cy - half + cornerLength), Offset(cx - half, cy - half), Offset(cx - half + cornerLength, cy - half)],
      // Top-right
      [Offset(cx + half - cornerLength, cy - half), Offset(cx + half, cy - half), Offset(cx + half, cy - half + cornerLength)],
      // Bottom-left
      [Offset(cx - half, cy + half - cornerLength), Offset(cx - half, cy + half), Offset(cx - half + cornerLength, cy + half)],
      // Bottom-right
      [Offset(cx + half - cornerLength, cy + half), Offset(cx + half, cy + half), Offset(cx + half, cy + half - cornerLength)],
    ];

    for (final pts in corners) {
      final path = Path()
        ..moveTo(pts[0].dx, pts[0].dy)
        ..lineTo(pts[1].dx, pts[1].dy)
        ..lineTo(pts[2].dx, pts[2].dy);
      canvas.drawPath(path, borderPaint);
    }

    // Scan line
    final scanY = cutout.top + cutoutSize * animationValue;
    final scanLinePaint = Paint()
      ..shader = LinearGradient(
        colors: [
          borderColor.withOpacity(0),
          borderColor.withOpacity(0.85),
          borderColor.withOpacity(0),
        ],
      ).createShader(Rect.fromLTWH(cutout.left, scanY, cutoutSize, 1.5));

    canvas.drawLine(
      Offset(cutout.left, scanY),
      Offset(cutout.right, scanY),
      scanLinePaint..strokeWidth = 1.5,
    );
  }

  @override
  bool shouldRepaint(ScanOverlayPainter old) =>
      old.animationValue != animationValue ||
      old.borderColor != borderColor ||
      old.cutoutSize != cutoutSize;
}