import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:flutter/foundation.dart';

import '../generated/l10n.dart';
import '../services/ColorService.dart';
import '../utils/Assets.dart';

class MapBlock extends StatelessWidget {
  final GestureTapCallback onTap;
  final double? height;

  MapBlock({
    Key? key,
    this.height = 180,
    required this.onTap,
  }) : super(key: key);
  final colorService = Injector().get<ColorService>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            child: (defaultTargetPlatform == TargetPlatform.iOS ||
                    defaultTargetPlatform == TargetPlatform.android)
                ? Expanded(
                    child: YandexMap(),
                  )
                : Image.asset(A.assetsMapExampleImg, fit: BoxFit.fitWidth),
          ),
          Container(
            width: double.infinity,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black.withOpacity(0.44),
                  ),
                ),
              ),
            ),
          ),
          Text(
            S.current.checkOnMap,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
