import 'package:flutter/material.dart';

class ColorService {
  Color primaryColor() {
    return const Color(0xFFF9B401);
  }

  LinearGradient primaryGradient(TileMode tileMode) {
    return LinearGradient(
      tileMode: tileMode,
      colors: const <Color>[
        Color(0xFFFF9356),
        Color(0xFFF9B401),
      ],
    );
  }

  Color secondaryGrey() {
    return const Color(0xFF707070);
  }

  Color desktopBackground() {
    return const Color(0xFFF7F7F7);
  }

  Color signInScreenTitleColor() {
    return const Color(0xFF262626);
  }

  Color signInDecorationLineColor() {
    return const Color(0xFFD3D3D3);
  }
}
