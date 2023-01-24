import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/AuthService.dart';
import '../services/ColorService.dart';
import '../services/FontService.dart';

class ModuleContainer {
  static Future<Injector> initialize(Injector injector) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    injector.map<ColorService>((i) => ColorService(), isSingleton: true);
    injector.map<FontService>((i) => FontService(), isSingleton: true);
    injector.map<AuthService>((i) => AuthService(prefs: preferences),
        isSingleton: true);
    return injector;
  }
}
