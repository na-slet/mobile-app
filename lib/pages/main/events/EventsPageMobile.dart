import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../../generated/l10n.dart';
import '../../../services/ColorService.dart';
import '../../../services/GradientService.dart';
import '../../../ui/Buttons.dart';
import '../../../ui/Cards.dart';
import '../../../utils/Assets.dart';

class EventsPageMobile extends StatelessWidget {
  EventsPageMobile({Key? key}) : super(key: key);
  final colorService = Injector().get<ColorService>();

  @override
  Widget build(BuildContext context) {

    final List<Widget> eventCardStates = [
      //участвовать
      Image.asset(
        A.assetsWaitPaymentEventCardStateIcon,
        color: colorService.logOutBottomColor(),
      ),
      //прикрепить скрин
      Image.asset(
        A.assetsInProgressEventCardStateIcon,
        color: colorService.inProgressEventCardStateColor(),
      ),
      //в обработке
      Image.asset(
        A.assetsDoneEventCardStateIcon,
        color: colorService.doneEventCardStateColor(),
      ),
      //збронировано
      Image.asset(
        A.assetsLockedEventCardStateIcon,
        color: colorService.bottomNavigationBarInactiveColor(),
      ),
    ];

    return Stack(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            A.assetsBackgroundFeed,
            fit: BoxFit.fitWidth,
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 30),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradinetLeftToRight(
                      blendMode: BlendMode.srcIn,
                      color: colorService.primaryGradient(),
                      child: Text(
                        S.current.eventsPageTittleText,
                        style: TextStyle(
                          color: colorService.primaryColor(),
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                PrimaryCard(
                  onTap: () {},
                  state: eventCardStates[1],
                  imgPath: A.assetsCardImgExample,
                  title: 'Слет «Файер»',
                  date: '14-17 февраля 2023',
                  ageLimit: 'от 15 до 18 лет',
                  location: 'Москва, ЦО',
                  description:
                      'Туристский слёт самое любимое, интересное и массовое  мероприятие, которое пользуется большой популярностью у детей и взрослых.',
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryCard(
                  onTap: () {},
                  state: eventCardStates[0],
                  imgPath: A.assetsCardImgExample,
                  title: 'Слет «Файер»',
                  date: '14-17 февраля 2023',
                  ageLimit: 'от 15 до 18 лет',
                  location: 'Москва, ЦО',
                  description:
                      'Туристский слёт самое любимое, интересное и массовое  мероприятие, которое пользуется большой популярностью у детей и взрослых.',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}