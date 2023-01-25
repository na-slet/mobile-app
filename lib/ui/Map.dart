import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:flutter/foundation.dart';

import '../generated/l10n.dart';
import '../services/ColorService.dart';
import '../utils/Assets.dart';
import '../utils/ScreenSize.dart';
import 'Buttons.dart';

class MapBlock extends StatelessWidget {
  final VoidCallback onTap;
  final double? height;

  MapBlock({
    Key? key,
    this.height = double.infinity,
    required this.onTap,
  }) : super(key: key);
  final colorService = Injector().get<ColorService>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: (defaultTargetPlatform == TargetPlatform.iOS ||
                    defaultTargetPlatform == TargetPlatform.android)
                ? const YandexMap()
                : Image.asset(A.assetsMapExampleImg, fit: BoxFit.fitWidth),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black.withOpacity(0.44),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    S.current.checkOnMap,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MapOpendBlock extends StatelessWidget {
  final VoidCallback onTapCloseButton;
  final double? height;

  MapOpendBlock({
    Key? key,
    required this.onTapCloseButton,
    this.height = double.infinity,
  }) : super(key: key);
  final colorService = Injector().get<ColorService>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: FractionallySizedBox(
        widthFactor: widthFactorMapPage(context),
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: double.infinity,
                    height: height,
                    child: (defaultTargetPlatform == TargetPlatform.iOS ||
                            defaultTargetPlatform == TargetPlatform.android)
                        ? Expanded(
                            child: YandexMap(),
                          )
                        : Image.asset(
                            (MediaQuery.of(context).size.width <=
                                    WidthFormFactor.tablet)
                                ? A.assetsMapExampleHightRes
                                : A.assetsMapExampleHightRes,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: ImgCircleButton(
                  onTap: onTapCloseButton,
                  width: 50,
                  height: 50,
                  widthImg: 10,
                  heightImg: 10,
                  imgPath: A.assetsMapCloseIcon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
