import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../services/ColorService.dart';
import '../services/GradientService.dart';

class PrimaryButton extends StatelessWidget {
  final colorService = Injector().get<ColorService>();

  final double height;
  final String? title;
  final LinearGradient gradient;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final bool enabled;
  final Widget? child;

  PrimaryButton({
    Key? key,
    this.height = 45,
    this.onTap,
    this.title,
    required this.gradient,
    this.textStyle,
    this.enabled = true,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradinetLeftToRight(
      blendMode: BlendMode.color,
      color: enabled ? gradient : colorService.inactiveGradient(),
      child: Center(
        child: Container(
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: enabled ? onTap : null,
              borderRadius: BorderRadius.circular(5),
              child: Center(
                child: child ?? Text(
                  title!,
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PrimaryTextButton extends StatelessWidget {
  final colorService = Injector().get<ColorService>();

  final double height;
  final String text;
  final TextStyle textStyle;
  final VoidCallback onTap;

  PrimaryTextButton({
    Key? key,
    this.height = 50,
    required this.onTap,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradinetLeftToRight(
      tileMode: TileMode.clamp,
      blendMode: BlendMode.srcIn,
      color: colorService.primaryGradient(),
      child: SizedBox(
        height: height,
        child: CupertinoButton(
          onPressed: onTap,
          borderRadius: BorderRadius.circular(5),
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final colorService = Injector().get<ColorService>();

  final double height;
  final double width;
  final String imgPath;
  final VoidCallback onTap;

  CircleButton({
    Key? key,
    this.height = 40,
    this.width = 40,
    required this.imgPath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: <Widget>[
          Image.asset(imgPath),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImgCircleButton extends StatelessWidget {
  final colorService = Injector().get<ColorService>();

  final double height;
  final double width;
  final String imgPath;
  final VoidCallback onTap;
  final double widthImg;
  final double heightImg;
 final   EdgeInsetsGeometry paddingImg;

  ImgCircleButton({
    Key? key,
    this.height = 40,
    this.width = 40,
    required this.imgPath,
    required this.onTap,
    this.widthImg = 20,
    this.heightImg = 20,
    this.paddingImg = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: widthImg,
            height: heightImg,
            child: Padding(
              padding: paddingImg,
              child: Image.asset(imgPath),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  final colorService = Injector().get<ColorService>();

  final double height;
  final double width;
  final Color color;
  final VoidCallback? onTap;
  final String imgPath;

  EditButton({
    Key? key,
    this.height = 40,
    this.width = 40,
    required this.onTap,
    required this.color,
    required this.imgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradinetLeftToRight(
      blendMode: BlendMode.color,
      color: colorService.primaryGradient(),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(imgPath),
            ),
          ),
        ),
      ),
    );
  }
}
