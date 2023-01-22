import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../../generated/l10n.dart';
import '../../../services/ColorService.dart';
import '../../../services/GradientService.dart';
import '../../../ui/Cards.dart';
import '../../../utils/Assets.dart';

class FeedPageMobile extends StatelessWidget {
  FeedPageMobile({Key? key}) : super(key: key);
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradinetLeftToRight(
                      blendMode: BlendMode.srcIn,
                      color: colorService.primaryGradient(),
                      child: Text(
                        S.current.feedPageTittleText,
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
                  imgPath: A.assetsPrimaryCardImgExample,
                  title: 'Слет «Файер»',
                  date: '14-17 февраля 2023',
                  ageLimit: 'от 15 до 18 лет',
                  location: 'Москва, ЦО',
                  description:
                  'Туристский слёт\nсамое любимое, интересное и\nмассовое  мероприятие,\nкоторое пользуется большой\nпопулярностью у детей и\nвзрослых.',
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryCard(
                  onTap: () {},
                  imgPath: A.assetsPrimaryCardImgExample,
                  title: 'Слет «Файер»',
                  date: '14-17 февраля 2023',
                  ageLimit: 'от 15 до 18 лет',
                  location: 'Москва, ЦО',
                  description:
                  'Туристский слёт\nсамое любимое, интересное и\nмассовое  мероприятие,\nкоторое пользуется большой\nпопулярностью у детей и\nвзрослых.',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
