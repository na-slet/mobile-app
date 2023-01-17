import 'package:flutter/material.dart';
import 'dart:ui';


class ColorService {
  Color primaryColor() {
    // Сделать градиент!
    return const Color(0xFFF9B401);
  }

  Color gradientStartColor() {
    return const Color(0xFFFF9356);
  }
  Color gradientEndColor() {
    return const Color(0xFFF9B401);
  }

  Color secondaryGrey() {
    return const Color(0xFF707070);
  }

  Color signInScreenTitleColor() {
    return const Color(0xFF262626);
  }

  Color signInDecorationLineColor() {
    return const Color(0xFFD3D3D3);
  }
}