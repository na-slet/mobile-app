import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import '../services/ColorService.dart';

class GradinetLeftToRight extends StatelessWidget {
  final colorService = Injector().get<ColorService>();

  final Widget child;
  final TileMode tileMode;
  final BorderRadius borderRadius;
  final BlendMode blendMode;
  final LinearGradient color;

  GradinetLeftToRight({
    Key? key,
    required this.child,
    required this.blendMode,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.tileMode = TileMode.clamp,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: ShaderMask(
        blendMode: blendMode,
        shaderCallback: (Rect bounds) {
          return color.createShader(bounds);
        },
        child: child,
      ),
    );
  }
}
// srcIn, srcATop, overlay!, color
