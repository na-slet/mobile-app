import 'package:flutter/cupertino.dart';

class WidthFormFactor {
  static double mobile = 360;
  static double tablet = 850;
  static double desktop = 950;
}

class HeightFormFactor {
  static double mobile = 360;
  static double tablet = 920;
  static double desktop = 1000;
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
    return  0.35;
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
  if (MediaQuery.of(context).size.height >= HeightFormFactor.desktop) {
    //desktop
    print("0.65");
    return 0.65;
  }
  else if (MediaQuery.of(context).size.height >= HeightFormFactor.tablet) {
    //tablet
    print("0.8");
    return 0.7;
  }
  else {
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
  if (MediaQuery.of(context).size.height >= HeightFormFactor.desktop) {
    //desktop
    return 0.65;
  }
  else if (MediaQuery.of(context).size.height >= HeightFormFactor.tablet) {
    //tablet
    return 0.7;
  }
  else {
    //no scale in mobile mode
    return 1;
  }
}

double setWidthFactor(BuildContext context) {
  if (MediaQuery.of(context).size.width < WidthFormFactor.tablet) {
    return ScreenSize.mobile.widthFactor;
  }
  else if ((MediaQuery.of(context).size.width > WidthFormFactor.mobile) &&
      (MediaQuery.of(context).size.width < WidthFormFactor.desktop)) {
    return ScreenSize.tablet.widthFactor;
  }
  return ScreenSize.desktop.widthFactor;
}

double setHeightFactor(BuildContext context) {
  if (MediaQuery.of(context).size.height >= HeightFormFactor.desktop) {
    return ScreenSize.mobile.heightFactor;
  }
  else if (MediaQuery.of(context).size.height >= HeightFormFactor.tablet) {
    return ScreenSize.tablet.heightFactor;
  }
  return ScreenSize.desktop.heightFactor;
}