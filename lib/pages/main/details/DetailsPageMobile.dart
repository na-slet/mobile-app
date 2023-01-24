import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../../generated/l10n.dart';
import '../../../services/ColorService.dart';
import '../../../services/GradientService.dart';
import '../../../ui/Buttons.dart';
import '../../../ui/Cards.dart';
import '../../../ui/Map.dart';
import '../../../utils/Assets.dart';
import '../../../utils/Routes.dart';

class DetailsPageMobile extends StatelessWidget {
  DetailsPageMobile({Key? key}) : super(key: key);
  final colorService = Injector().get<ColorService>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              A.assetsBackgroundFeed,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 30),
            child: Column(
              children: <Widget>[
                SizedBox(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ImgCircleButton(
                          onTap: () {},
                          height: 30,
                          width: 30,
                          widthImg: 16,
                          heightImg: 12,
                          imgPath: A.assetsDetailsPageArrowBackIcon,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 40,
                          child: GradinetLeftToRight(
                            blendMode: BlendMode.srcIn,
                            color: colorService.primaryGradient(),
                            child: Text(
                              S.current.detailPageTittleText,
                              style: TextStyle(
                                color: colorService.primaryColor(),
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                DetailCard(
                  onTap: () {},
                  onMapTap: () => Navigator.push(
                    context,
                    CupertinoModalPopupRoute(
                      builder: (context) => MapOpendBlock(
                        onTapCloseButton: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  state: 0,
                  title: 'Слёт «Файер»',
                  date: '14-17 февраля 2023',
                  ageLimit: 'от 15 до 18 лет',
                  eventType: 'Молодежный слёт',
                  locationType: 'Центральное объединение',
                  location: 'Рождественский бул., 20, Москва',
                  imgPath: '',
                  description:
                      'Туристский слёт самое любимое, интересное и массовое внеклассное мероприятие, которое пользуется большой популярностью у детей и взрослых.',
                  endRegistration: '12 февраля 2023',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
