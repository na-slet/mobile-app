import 'package:flutter/material.dart';

class ColorService {
  Color primaryColor() {
    return const Color(0xFFF97801);
  }

  LinearGradient primaryGradient() {
    return LinearGradient(
      colors: const <Color>[
        Color(0xFFFF9356),
        Color(0xFFF9B401),
      ],
    );
  }
  LinearGradient inactiveGradient() {
    return LinearGradient(
      colors: <Color>[
        Color(0xFF6A6A6A),
        Color(0xFF969696),
      ],
    );
  }

  LinearGradient logOutGradient() {
    return LinearGradient(
      colors: const <Color>[
        Color(0xFFB50D0D
        ),
        Color(0xFFE31717),
      ],
    );
  }

  Color secondaryGrey() {
    return const Color(0xFF707070);
  }

  Color bottomNavigationBarInactiveColor() {
    return Color(0xFF515151);
  }

  Color desktopBackground() {
    return const Color(0xFFF6F6F6);
  }

  Color signInScreenTitleColor() {
    return const Color(0xFF262626);
  }

  Color signInDecorationLineColor() {
    return const Color(0xFFD3D3D3);
  }

  Color profilePageTexFieldHintColor() {
    return const Color(0xFF909090);
  }
  Color profilePageAvatarBoxShadowColor() {
    return const Color(0xFF8187BD).withOpacity(0.15);
  }

  Color logOutBottomColor() {
    return const Color(0xFFB50D0D);
  }

  Color cardInfoTextColor() {
    return const Color(0xFF606060);
  }

  Color cardTitleTextColor() {
    return const Color(0xFF343434);
  }
}
