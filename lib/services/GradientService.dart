import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import '../services/ColorService.dart';

class GradinetPattern extends StatelessWidget {
  final colorService = Injector().get<ColorService>();

  final Widget child;
  final Color gradientStartColor;
  final Color gradientEndColor;
  final BorderRadius borderRadius;
  final BlendMode blendMode;

  GradinetPattern({
    Key? key,
    required this.child,
    required this.gradientStartColor,
    required this.gradientEndColor,
    this.blendMode = BlendMode.color,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: ShaderMask(
        blendMode: blendMode,
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: <Color>[gradientStartColor, gradientEndColor],
          ).createShader(bounds);
        },
        child: child,
      ),
    );
  }
}
// srcIn, srcATop, overlay!, color
