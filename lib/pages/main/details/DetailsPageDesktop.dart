import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../../generated/l10n.dart';
import '../../../models/Event.dart';
import '../../../services/ColorService.dart';
import '../../../services/GradientService.dart';
import '../../../ui/Buttons.dart';
import '../../../ui/Cards.dart';
import '../../../utils/Assets.dart';
import '../../../utils/ScreenSize.dart';

class DetailsPageDesktop extends StatelessWidget {
  final Event event;
  final colorService = Injector().get<ColorService>();

  DetailsPageDesktop({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? columnWidth = widthFactorFeedPageDesktop(context);
    final double horizontalPadding = horizontalPaddingDetailPage(context);

    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: FractionallySizedBox(
        widthFactor: columnWidth,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: 25),
              child: Column(
                children: [
                  SizedBox(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ImgCircleButton(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
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
                                  fontWeight: FontWeight.w900,
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
                  DetailCardDesktop(
                    onTap: () {},
                    state: 2,
                    title: 'Слёт «Файер»',
                    date: '14-17 февраля 2023',
                    ageLimit: 'от 15 до 18 лет',
                    eventType: 'Молодежный слёт',
                    locationType: 'Центральное объединение',
                    location: 'Рождественский бул., 20, Москва',
                    description:
                        'Туристский слёт самое любимое, интересное и массовое внеклассное мероприятие, которое пользуется большой популярностью у детей и взрослых.',
                    endRegistration: '12 февраля 2023',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
