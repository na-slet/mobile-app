import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../ui/Cards.dart';
import '../../../utils/Routes.dart';
import '../../../utils/ScreenSize.dart';
import '../../../utils/Assets.dart';

class FeedPageDesktop extends StatelessWidget {
  const FeedPageDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        S.current.feedPageTittleText,
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
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Routes.detailsPage);
                              },
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
