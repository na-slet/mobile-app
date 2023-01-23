import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../services/ColorService.dart';
import 'package:gradient_borders/gradient_borders.dart';
import '../utils/Assets.dart';
import '../utils/ScreenSize.dart';
import 'Buttons.dart';

class PrimaryCard extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String date;
  final String ageLimit;
  final String location;
  final String imgPath;
  final String description;
  final Widget? state;

  PrimaryCard({
    Key? key,
    required this.title,
    required this.date,
    required this.ageLimit,
    required this.location,
    required this.imgPath,
    required this.description,
    required this.onTap, this.state,
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
        color: colorService.cardInfoTextColor());

    final TextStyle descriptionTextStyle = TextStyle(
        fontSize: 14,
        // fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
        color: colorService.cardTitleTextColor());

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: GradientBoxBorder(
              gradient: colorService.primaryGradient(), width: 2),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: colorService.cardTitleTextColor(),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: state == null ? Container() : SizedBox(
                        width: 19,
                        height: 19,
                        child: state,
                      )
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                    width: widthInfoIcon,
                    height: heightInfoIcon,
                    child: Image.asset(A.assetsCardDateIcon)),
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
                    child: Image.asset(A.assetsCardAvatarIcon)),
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
                    child: Image.asset(A.assetsCardLocationIcon)),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  location,
                  style: infoTextStyle,
                ),
              ],
            ),
            SizedBox(
              height: 180,
              child: Image.asset(imgPath),
            ),
            const SizedBox(
              height: 8,
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

class DetailCard extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String date;
  final String ageLimit;
  final String eventType;
  final String location;
  final String locationType;
  final String imgPath;
  final String description;
  final String endRegistration;
  final Widget detailButtonChild;

  DetailCard({
    Key? key,
    required this.onTap,
    required this.title,
    required this.date,
    required this.ageLimit,
    required this.eventType,
    required this.locationType,
    required this.location,
    required this.imgPath,
    required this.description,
    required this.endRegistration,
    required this.detailButtonChild,
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
        color: colorService.cardInfoTextColor());

    final TextStyle descriptionTextStyle = TextStyle(
        fontSize: 14,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
        color: colorService.cardTitleTextColor());

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: GradientBoxBorder(
            gradient: colorService.primaryGradient(),
            width: 2,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: colorService.cardTitleTextColor(),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Row(
                  children: <Widget>[
                    SizedBox(
                        width: widthInfoIcon,
                        height: heightInfoIcon,
                        child: Image.asset(A.assetsCardDateIcon)),
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
                        child: Image.asset(A.assetsCardAvatarIcon)),
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
                        child: Image.asset(A.assetsCardEventTypeIcon)),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      eventType,
                      style: infoTextStyle,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                        width: widthInfoIcon,
                        height: heightInfoIcon,
                        child: Image.asset(A.assetsCardLocationIcon)),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      locationType,
                      style: infoTextStyle,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                        width: widthInfoIcon,
                        height: heightInfoIcon,
                        child: Image.asset(A.assetsCardSecondaryLocationIcon)),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      location,
                      style: infoTextStyle,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Container(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: descriptionTextStyle,
            ),
            SizedBox(
              height: 15,
            ),
            detailButtonChild,
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Конец регистрации: ${endRegistration}',
                style: descriptionTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailCardDesktop extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String date;
  final String ageLimit;
  final String eventType;
  final String location;
  final String locationType;
  final String imgPath;
  final String description;
  final String endRegistration;
  final Widget detailButtonChild;

  DetailCardDesktop({
    Key? key,
    required this.onTap,
    required this.title,
    required this.date,
    required this.ageLimit,
    required this.eventType,
    required this.locationType,
    required this.location,
    required this.imgPath,
    required this.description,
    required this.endRegistration,
    required this.detailButtonChild,
  }) : super(key: key);

  final colorService = Injector().get<ColorService>();

  @override
  Widget build(BuildContext context) {
    final TextStyle infoTextStyle = TextStyle(
        fontSize: 14,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
        color: colorService.cardInfoTextColor());

    final TextStyle descriptionTextStyle = TextStyle(
        fontSize: 14,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
        color: colorService.cardTitleTextColor());

    final columnWidth = widthColumnDetailPageDesktop(context);
    const double widthInfoIcon = 14;
    const double heightInfoIcon = 14;
    final double registrationTextWith = MediaQuery.of(context).size.width * 0.2;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: GradientBoxBorder(
          gradient: colorService.primaryGradient(),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: columnWidth,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: colorService.cardTitleTextColor(),
                        ),
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        color: Colors.greenAccent,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                          width: widthInfoIcon,
                          height: heightInfoIcon,
                          child: Image.asset(A.assetsCardDateIcon)),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        date,
                        style: infoTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                          width: widthInfoIcon,
                          height: heightInfoIcon,
                          child: Image.asset(A.assetsCardEventTypeIcon)),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        eventType,
                        style: infoTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                          width: widthInfoIcon,
                          height: heightInfoIcon,
                          child: Image.asset(A.assetsCardAvatarIcon)),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        ageLimit,
                        style: infoTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Text(
                      description,
                      style: descriptionTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: columnWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 185,
                    color: Colors.greenAccent,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                          width: widthInfoIcon,
                          height: heightInfoIcon,
                          child: Image.asset(A.assetsCardLocationIcon)),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        locationType,
                        style: infoTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                          width: widthInfoIcon,
                          height: heightInfoIcon,
                          child: Image.asset(A.assetsCardSecondaryLocationIcon)),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        location,
                        style: infoTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      detailButtonChild,
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: registrationTextWith,
                        child: Text(
                          'Конец регистрации: ${endRegistration}',
                          style: descriptionTextStyle,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
