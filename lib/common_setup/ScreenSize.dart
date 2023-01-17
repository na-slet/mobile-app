import 'package:flutter/cupertino.dart';

class FormFactor {
  static double mobile = 300;
  static double tablet = 800;
  static double desktop = 900;
}

enum ScreenSize {
  mobile,
  tablet,
  desktop,
}

extension ScreenSizeExtension on ScreenSize {
  double get widthFactor {
    switch (this) {
      case ScreenSize.mobile:
        return 0.6;
      case ScreenSize.tablet:
        return 0.3;
      case ScreenSize.desktop:
        return 0.2;
    }
  }
  double get heightFactor {
    switch (this) {
      case ScreenSize.mobile:
        return 0.9;
      case ScreenSize.tablet:
        return 0.85;
      case ScreenSize.desktop:
        return 0.8;
    }
  }
}

double setWidthFactor(BuildContext context) {
  if (MediaQuery.of(context).size.width < FormFactor.tablet) {
    return ScreenSize.mobile.widthFactor;
  }
  else if ((MediaQuery.of(context).size.width > FormFactor.mobile) &&
  (MediaQuery.of(context).size.width < FormFactor.desktop)) {
    return ScreenSize.tablet.widthFactor;
  }
  return ScreenSize.desktop.widthFactor;
}

double setheightFactor(BuildContext context) {
  if (MediaQuery.of(context).size.height < FormFactor.tablet) {
    return ScreenSize.mobile.heightFactor;
  }
  else if ((MediaQuery.of(context).size.height > FormFactor.mobile) &&
      (MediaQuery.of(context).size.height < FormFactor.desktop)) {
    return ScreenSize.tablet.heightFactor;
  }
  return ScreenSize.desktop.heightFactor;
}