// import 'package:duka_app_courier/services/APIService.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:naslet_mobile/services/AuthService.dart';

import '../services/ColorService.dart';
import '../services/FontService.dart';

class ModuleContainer {
  static Injector initialize(Injector injector) {
    injector.map<ColorService>((i) => ColorService(), isSingleton: true);
    injector.map<FontService>((i) => FontService(), isSingleton: true);
    injector.map<AuthService>((i) => AuthService(), isSingleton: true);
    return injector;
  }
}
