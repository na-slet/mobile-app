import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../../generated/l10n.dart';
import '../../../services/ColorService.dart';
import '../../../ui/Cards.dart';
import '../../../utils/Assets.dart';
import '../../../utils/ScreenSize.dart';

class EventsPageDesktop extends StatelessWidget {
  EventsPageDesktop({Key? key}) : super(key: key);

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

    double widthBetweenCards = MediaQuery.of(context).size.width * 0.04;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: FractionallySizedBox(
        widthFactor: widthFactorFeedPageDesktop(context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        S.current.eventsPageTittleText,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: PrimaryCard(
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
                          ),
                          SizedBox(
                            width: widthBetweenCards,
                          ),
                          Flexible(
                            child: PrimaryCard(
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
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: PrimaryCard(
                              onTap: () {},
                              state: eventCardStates[2],
                              imgPath: A.assetsCardImgExample,
                              title: 'Слет «Файер»',
                              date: '14-17 февраля 2023',
                              ageLimit: 'от 15 до 18 лет',
                              location: 'Москва, ЦО',
                              description:
                              'Туристский слёт самое любимое, интересное и массовое  мероприятие, которое пользуется большой популярностью у детей и взрослых.',
                            ),
                          ),
                          SizedBox(
                            width: widthBetweenCards,
                          ),
                          Flexible(
                            child: PrimaryCard(
                              onTap: () {},
                              state: eventCardStates[3],
                              imgPath: A.assetsCardImgExample,
                              title: 'Слет «Файер»',
                              date: '14-17 февраля 2023',
                              ageLimit: 'от 15 до 18 лет',
                              location: 'Москва, ЦО',
                              description:
                              'Туристский слёт самое любимое, интересное и массовое  мероприятие, которое пользуется большой популярностью у детей и взрослых.',
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
