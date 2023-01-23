import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../generated/l10n.dart';
import '../../../services/ColorService.dart';
import '../../../services/GradientService.dart';
import '../../../ui/Buttons.dart';
import '../../../ui/Cards.dart';
import '../../../utils/Assets.dart';
import '../../../utils/ScreenSize.dart';

class DetailsPageDesktop extends StatelessWidget {
  DetailsPageDesktop({Key? key}) : super(key: key);

  final colorService = Injector().get<ColorService>();

  final TextStyle detailButtonTextStyle =
      TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    final List<Widget> detailButtonStates = [
      //участвовать
      SecondaryButton(
        gradient: colorService.primaryGradient(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              child: SizedBox(
                child: Image.asset(A.assetsParticipateDetailButtonState),
                width: 17,
                height: 17,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              S.current.detailButtonStateParticipate,
              style: detailButtonTextStyle,
            ),
          ],
        ),
      ),

      //прикрепить скрин
      SecondaryButton(
        gradient: colorService.logOutGradient(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset(A.assetsScanShareDetailButtonState),
              width: 17,
              height: 17,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              S.current.detailButtonStateShareScreen,
              style: detailButtonTextStyle,
            ),
          ],
        ),
      ),

      //в обработке
      SecondaryButton(
        gradient: colorService.inProgressGradient(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset(A.assetsInProgressDetailButtonState),
              width: 17,
              height: 17,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              S.current.detailButtonStateInProgress,
              style: detailButtonTextStyle,
            ),
          ],
        ),
      ),

      //збронировано
      SecondaryButton(
        gradient: colorService.bookedGradient(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset(A.assetsBookedDetailButtonState),
              width: 17,
              height: 17,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              S.current.detailButtonStateBooked,
              style: detailButtonTextStyle,
            ),
          ],
        ),
      ),
    ];
    double? columnWidth = widthFactorFeedPageDesktop(context);

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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
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
                    detailButtonChild: detailButtonStates[0],
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
