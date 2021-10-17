import 'package:flutter/material.dart';

class CustomProfileClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width + 110, size.height);
    path.quadraticBezierTo(size.width / 1.15, size.height * 1.50,
        size.width / 1.020, size.height * 0.035);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
