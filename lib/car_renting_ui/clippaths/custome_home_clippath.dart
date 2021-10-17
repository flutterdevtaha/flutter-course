import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.7, size.height);
    path.quadraticBezierTo(
      size.width / 1.50,
      size.height * 0.60,
      size.width,
      size.height / 1.55,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
