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
    return 0.35;
  } else if (setWidthFactor(context) == ScreenSize.tablet.widthFactor) {
    //tablet
    return 0.6;
  } else {
    //no scale in mobile mode
    return 1;
  }
}

double setSignInOptionHeight(BuildContext context) {
  if (MediaQuery.of(context).size.height >= HeightFormFactor.desktop) {
    //desktop
    return 0.65;
  } else if (MediaQuery.of(context).size.height >= HeightFormFactor.tablet) {
    //tablet
    return 0.7;
  } else {
    return 1;
  }
}

double setSignUpOptionWidth(BuildContext context) {
  if ((setWidthFactor(context) == ScreenSize.desktop.widthFactor) &&
      (MediaQuery.of(context).size.width >= 1300)) {
    //desktop
    return 0.35;
  } else if ((setWidthFactor(context) == ScreenSize.desktop.widthFactor) &&
      (MediaQuery.of(context).size.width < 1300)) {
    //desktop
    return 0.7;
  } else if (setWidthFactor(context) == ScreenSize.tablet.widthFactor) {
    //tablet
    return 0.6;
  } else {
    //no scale in mobile mode
    return 1;
  }
}

double setSignUpOptionHeight(BuildContext context) {
  if (MediaQuery.of(context).size.height >= HeightFormFactor.desktop) {
    //desktop
    return 0.65;
  } else if (MediaQuery.of(context).size.height >= HeightFormFactor.tablet) {
    //tablet
    return 0.7;
  } else {
    //no scale in mobile mode
    return 1;
  }
}

double setWidthFactor(BuildContext context) {
  if (MediaQuery.of(context).size.width < WidthFormFactor.tablet) {
    return ScreenSize.mobile.widthFactor;
  } else if ((MediaQuery.of(context).size.width > WidthFormFactor.mobile) &&
      (MediaQuery.of(context).size.width < WidthFormFactor.desktop)) {
    return ScreenSize.tablet.widthFactor;
  }
  return ScreenSize.desktop.widthFactor;
}

double setHeightFactor(BuildContext context) {
  if (MediaQuery.of(context).size.height >= HeightFormFactor.desktop) {
    return ScreenSize.mobile.heightFactor;
  } else if (MediaQuery.of(context).size.height >= HeightFormFactor.tablet) {
    return ScreenSize.tablet.heightFactor;
  }
  return ScreenSize.desktop.heightFactor;
}

double widthFactorProfilePageDesktop(BuildContext context) {
  if (MediaQuery.of(context).size.width >= 1200) {
    return 0.5;
  } else if (MediaQuery.of(context).size.width >= 1024) {
    return 0.67;
  }
  return 0.9;
}

double heightFactorProfilePageDesktop(BuildContext context) {
  if (MediaQuery.of(context).size.height >= HeightFormFactor.desktop) {
    return 0.45;
  } else if (MediaQuery.of(context).size.height >= HeightFormFactor.tablet) {
    return 0.68;
  } else if (MediaQuery.of(context).size.height >= 800) {
    return 0.75;
  } else if (MediaQuery.of(context).size.height >= 600) {
    return 0.94;
  }
  return 0.9;
}

double? setColumnWidthProfilePageDesktop(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.width;
  if (widthFactorProfilePageDesktop(context) == 0.5) {
    return deviceWidth * 0.22;
  } else if (widthFactorProfilePageDesktop(context) == 0.67) {
    return deviceWidth * 0.28;
  }
  return deviceWidth * 0.4;
}

double setDateDropDownWidthProfilePageDesktop(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.width;
  if (widthFactorProfilePageDesktop(context) == 0.5) {
    return deviceWidth * 0.059;
  } else if (widthFactorProfilePageDesktop(context) == 0.67) {
    return deviceWidth * 0.07;
  }
  return deviceWidth * 0.1;
}

double widthFactorFeedPageDesktop(BuildContext context) {
  if (MediaQuery.of(context).size.width >= 1322) {
    return 0.5;
  } else if (MediaQuery.of(context).size.width >= 1220) {
    return 0.65;
  } else if (MediaQuery.of(context).size.width >= 1024) {
    return 0.7;
  }
  return 0.8;
}

double widthFactorDetailPageDesktop(BuildContext context) {
  if (MediaQuery.of(context).size.width >= 1322) {
    return 0.5;
  } else if (MediaQuery.of(context).size.width >= 1220) {
    return 0.65;
  } else if (MediaQuery.of(context).size.width >= 1024) {
    return 0.7;
  }
  return 0.8;
}

double widthColumnDetailPageDesktop(BuildContext context) {
  if (MediaQuery.of(context).size.width >= 1322) {
    return MediaQuery.of(context).size.width * 0.2;
  } else if (MediaQuery.of(context).size.width >= 1220) {
    return MediaQuery.of(context).size.width * 0.23;
  } else if (MediaQuery.of(context).size.width >= 1024) {
    return MediaQuery.of(context).size.width * 0.26;
  }
  return MediaQuery.of(context).size.width * 0.3;
}

double horizontalPaddingDetailPage(BuildContext context) {
  if (MediaQuery.of(context).size.width >= 1322) {
    return MediaQuery.of(context).size.width * 0.025;
  } else if (MediaQuery.of(context).size.width >= 1220) {
    return MediaQuery.of(context).size.width * 0.04;
  }
  return MediaQuery.of(context).size.width * 0.05;
}
