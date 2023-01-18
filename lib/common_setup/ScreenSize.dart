import 'package:flutter/cupertino.dart';

class FormFactor {
  static double mobile = 360;
  static double tablet = 850;
  static double desktop = 950;
}

enum ScreenSize {
  mobile,
  tablet,
  desktop,
}

extension ScreenSizeExtension on ScreenSize {
  double get widthFactor {
    switch (this) {
      case ScreenSize.desktop:
        return 0.55;
      case ScreenSize.tablet:
        return 0.5;
      case ScreenSize.mobile:
        return 0.6;
    }
  }
  double get heightFactor {
    switch (this) {
      case ScreenSize.desktop:
        return 0.85;
      case ScreenSize.tablet:
        return 0.9;
      case ScreenSize.mobile:
        return 0.91;
    }
  }
}

double setSignInOptionWidth(BuildContext context) {
  if (setWidthFactor(context) == ScreenSize.desktop.widthFactor) {
    //desktop
    return  0.4;
  }
  else if (setWidthFactor(context) == ScreenSize.tablet.widthFactor) {
    //tablet
    return 0.6;
  }
  else {
    //no scale in mobile mode
    return 1;
  }
}

double setSignInOptionHeight(BuildContext context) {
  if (setHeightFactor(context) == ScreenSize.desktop.heightFactor) {
    //desktop
    return 0.71;
  }
  else if (setHeightFactor(context) == ScreenSize.tablet.heightFactor) {
    //tablet
    return 0.8;
  }
  else {
    //no scale in mobile mode
    return 1;
  }
}

double setSignUpOptionWidth(BuildContext context) {
  if ((setWidthFactor(context) == ScreenSize.desktop.widthFactor) && (MediaQuery.of(context).size.width >= 1300)) {
    //desktop
    return  0.35;
  }
  else if ((setWidthFactor(context) == ScreenSize.desktop.widthFactor) && (MediaQuery.of(context).size.width < 1300)) {
  //desktop
  return  0.7;
  }
  else if (setWidthFactor(context) == ScreenSize.tablet.widthFactor) {
    //tablet
    return 0.6;
  }
  else {
    //no scale in mobile mode
    return 1;
  }
}

double setSignUpOptionHeight(BuildContext context) {
  if (setHeightFactor(context) == ScreenSize.desktop.heightFactor) {
    //desktop
    return 0.75;
  }
  else if (setHeightFactor(context) == ScreenSize.tablet.heightFactor) {
    //tablet
    return 0.9;
  }
  else {
    //no scale in mobile mode
    return 1;
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

double setHeightFactor(BuildContext context) {
  if (MediaQuery.of(context).size.height < FormFactor.tablet) {
    return ScreenSize.mobile.heightFactor;
  }
  else if ((MediaQuery.of(context).size.height > FormFactor.tablet) &&
      (MediaQuery.of(context).size.height < FormFactor.desktop)) {
    return ScreenSize.tablet.heightFactor;
  }
  return ScreenSize.desktop.heightFactor;
}