import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import '../services/ColorService.dart';

class GradinetLeftToRight extends StatelessWidget {
  final colorService = Injector().get<ColorService>();

  final Widget child;
  final TileMode tileMode;
  final BorderRadius borderRadius;
  final BlendMode blendMode;

  GradinetLeftToRight({
    Key? key,
    required this.child,
    this.blendMode = BlendMode.color,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    required this.tileMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: ShaderMask(
        blendMode: blendMode,
        shaderCallback: (Rect bounds) {
          return colorService.primaryGradient(tileMode).createShader(bounds);
        },
        child: child,
      ),
    );
  }
}
// srcIn, srcATop, overlay!, color
