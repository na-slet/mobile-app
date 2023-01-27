import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:flutter/foundation.dart';

import '../generated/l10n.dart';
import '../services/ColorService.dart';
import '../utils/Assets.dart';
import '../utils/ScreenSize.dart';
import 'Buttons.dart';

class MapBlock extends StatefulWidget {
  final VoidCallback onTap;
  final double? height;
  final double latitude;
  final double longitude;

  const MapBlock(
      {Key? key,
      required this.onTap,
      this.height,
      this.latitude = 0.0,
      this.longitude = 0.0})
      : super(key: key);

  @override
  State<MapBlock> createState() => _MapBlockState();
}

class _MapBlockState extends State<MapBlock> {
  final colorService = Injector().get<ColorService>();

  late YandexMapController controller;

  final List<MapObject> mapObjects = [];

  final animation = MapAnimation(type: MapAnimationType.smooth, duration: 2.0);

  @override
  Widget build(BuildContext context) {
    final MapObject mapObject = PlacemarkMapObject(
      mapId: MapObjectId('normal_icon_placemark'),
      point: Point(latitude: widget.latitude, longitude: widget.latitude),
      opacity: 1,
      direction: 90,
      isDraggable: false,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(A.assetsPlaceMapIcon),
          rotationType: RotationType.noRotation,
        ),
      ),
    );

    final Point point =
        Point(latitude: widget.latitude, longitude: widget.longitude);

    return SizedBox(
      height: widget.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: (defaultTargetPlatform == TargetPlatform.iOS ||
                    defaultTargetPlatform == TargetPlatform.android)
                ? YandexMap(
                    mapObjects: mapObjects,
                    onMapCreated:
                        (YandexMapController yandexMapController) async {
                      print('${widget.longitude} ${widget.latitude}');
                      controller = yandexMapController;
                      final cameraPosition =
                          await controller.getCameraPosition();
                      await controller.moveCamera(
                          CameraUpdate.newCameraPosition(
                              CameraPosition(target: point)),
                          animation: animation);
                      setState(() {
                        mapObjects.add(mapObject);
                      });
                    },
                  )
                : Image.asset(A.assetsMapExampleImg, fit: BoxFit.fitWidth),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.onTap,
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

class MapOpendBlock extends StatefulWidget {
  final VoidCallback onTapCloseButton;
  final double? height;
  final double latitude;
  final double longitude;

  MapOpendBlock({
    Key? key,
    required this.onTapCloseButton,
    this.height = double.infinity,
    this.latitude = 0.0,
    this.longitude = 0.0,
  }) : super(key: key);

  @override
  State<MapOpendBlock> createState() => _MapOpendBlockState();
}

class _MapOpendBlockState extends State<MapOpendBlock> {
  final colorService = Injector().get<ColorService>();

  late YandexMapController controller;

  final List<MapObject> mapObjects = [];

  final animation = MapAnimation(type: MapAnimationType.smooth, duration: 2.0);

  @override
  Widget build(BuildContext context) {
    final MapObject mapObject = PlacemarkMapObject(
      mapId: MapObjectId('normal_icon_placemark'),
      point: Point(latitude: widget.latitude, longitude: widget.latitude),
      opacity: 1,
      direction: 90,
      isDraggable: false,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(A.assetsPlaceMapIcon),
          rotationType: RotationType.noRotation,
        ),
      ),
    );

    final Point point =
        Point(latitude: widget.latitude, longitude: widget.longitude);

    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: FractionallySizedBox(
        widthFactor: widthFactorMapPage(context),
        child: SizedBox(
          height: widget.height,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: double.infinity,
                    height: widget.height,
                    child: (defaultTargetPlatform == TargetPlatform.iOS ||
                            defaultTargetPlatform == TargetPlatform.android)
                        ? Expanded(
                            child: YandexMap(
                              mapObjects: mapObjects,
                              onMapCreated: (YandexMapController
                                  yandexMapController) async {
                                controller = yandexMapController;
                                final cameraPosition =
                                    await controller.getCameraPosition();
                                await controller.moveCamera(
                                    CameraUpdate.newCameraPosition(
                                        CameraPosition(target: point)),
                                    animation: animation);
                                setState(() {
                                  mapObjects.add(mapObject);
                                });
                              },
                            ),
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
                  onTap: widget.onTapCloseButton,
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
