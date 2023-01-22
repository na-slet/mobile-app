import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../services/ColorService.dart';
import 'package:gradient_borders/gradient_borders.dart';
import '../utils/Assets.dart';
import 'Buttons.dart';

class PrimaryCard extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String date;
  final String ageLimit;
  final String location;
  final String imgPath;
  final String description;

  PrimaryCard({
    Key? key,
    required this.title,
    required this.date,
    required this.ageLimit,
    required this.location,
    required this.imgPath,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  final colorService = Injector().get<ColorService>();

  final double widthInfoIcon = 14;
  final double heightInfoIcon = 14;

  @override
  Widget build(BuildContext context) {

    final TextStyle infoTextStyle = TextStyle(
        fontSize: 14,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
        color: colorService.cardInfoTextColor()
    );

    final TextStyle descriptionTextStyle = TextStyle(
      fontSize: 14,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w400,
      color: colorService.cardTitleTextColor()
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: GradientBoxBorder(
            gradient: colorService.primaryGradient(),
            width: 2
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: colorService.cardTitleTextColor(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                    width: widthInfoIcon,
                    height: heightInfoIcon,
                    child: Image.asset(A.assetsPrimaryCardDateIcon)),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  date,
                  style: infoTextStyle,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(
                    width: widthInfoIcon,
                    height: heightInfoIcon,
                    child: Image.asset(A.assetsPrimaryCardDateIcon)),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  ageLimit,
                  style: infoTextStyle,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(
                    width: widthInfoIcon,
                    height: heightInfoIcon,
                    child: Image.asset(A.assetsPrimaryCardLocationIcon)),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  location,
                  style: infoTextStyle,
                ),
              ],
            ),
            Container(
              height: 180,
              child: Image.asset(imgPath),
            ),
            Text(
              description,
              style: descriptionTextStyle,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ImgCircleButton(
                onTap: onTap,
                height: 40,
                width: 40,
                widthImg: 16,
                heightImg: 12,
                imgPath: A.assetsPrimaryCardRightArrowIcon,
              ),
            )
          ],
        ),
      ),
    );
  }
}