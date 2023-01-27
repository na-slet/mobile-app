import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:naslet/services/APIService.dart';

import '../generated/l10n.dart';
import '../models/EventState.dart';
import '../services/ColorService.dart';
import 'package:gradient_borders/gradient_borders.dart';
import '../services/GradientService.dart';
import '../utils/Assets.dart';
import '../utils/ScreenSize.dart';
import 'Buttons.dart';
import 'Map.dart';

class PrimaryCard extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String date;
  final String ageLimit;
  final String location;
  final String imgPath;
  final String description;
  final EventState? state;

  PrimaryCard({
    Key? key,
    required this.title,
    required this.date,
    required this.ageLimit,
    required this.location,
    required this.imgPath,
    required this.description,
    required this.onTap,
    this.state,
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
    final Map<EventState, Widget> eventCardStates = {
      EventState.paymentNeeded: Image.asset(
        A.assetsWaitPaymentEventCardStateIcon,
        color: colorService.logOutBottomColor(),
      ),
      EventState.awaiting: Image.asset(
        A.assetsInProgressEventCardStateIcon,
        color: colorService.inProgressEventCardStateColor(),
      ),
      EventState.approved: Image.asset(
        A.assetsDoneEventCardStateIcon,
        color: colorService.doneEventCardStateColor(),
      ),
      EventState.closed: Image.asset(
        A.assetsLockedEventCardStateIcon,
        color: colorService.bottomNavigationBarInactiveColor(),
      ),
    };

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
                      child: state == null
                          ? Container()
                          : SizedBox(
                              width: 19,
                              height: 19,
                              child: eventCardStates[state],
                            )),
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
            const SizedBox(
              height: 4,
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
            const SizedBox(
              height: 4,
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
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 180,
              child: Image.network('${APIService.url}/$imgPath'),
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
                widthImg: 25,
                heightImg: 20,
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
  final String title;
  final String date;
  final String ageLimit;
  final String eventType;
  final String location;
  final String locationType;
  final String description;
  final String endRegistration;
  final VoidCallback onTap;
  final VoidCallback onMapTap;
  final EventState state;
  final String price;

  DetailCard({
    Key? key,
    required this.title,
    required this.date,
    required this.ageLimit,
    required this.eventType,
    required this.locationType,
    required this.location,
    required this.description,
    required this.endRegistration,
    this.state = EventState.notParticipated,
    required this.onTap,
    required this.onMapTap,
    required this.price,
  }) : super(key: key);

  final colorService = Injector().get<ColorService>();

  final double widthInfoIcon = 14;
  final double heightInfoIcon = 14;

  @override
  Widget build(BuildContext context) {
    final TextStyle detailButtonTextStyle = TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600);

    final TextStyle infoTextStyle = TextStyle(
        fontSize: 14,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
        color: colorService.cardInfoTextColor());

    final TextStyle descriptionTextStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: colorService.cardTitleTextColor());

    final Map<EventState, Widget> detailCardStates = {
      EventState.notParticipated: Image.asset(
        A.assetsParticipateDetailButtonState,
        color: colorService.primaryColor(),
      ),
      EventState.notParticipated: Image.asset(
        A.assetsScanShareDetailButtonState,
        color: colorService.logOutBottomColor(),
      ),
      EventState.awaiting: Image.asset(
        A.assetsInProgressDetailButtonState,
        color: colorService.inProgressEventCardStateColor(),
      ),
      EventState.approved: Image.asset(
        A.assetsBookedDetailButtonState,
        color: colorService.doneEventCardStateColor(),
      ),
    };
    final Map<EventState, Widget> detailButtonStates = {
      EventState.notParticipated: PrimaryButton(
        onTap: onTap,
        gradient: colorService.primaryGradient(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset(A.assetsParticipateDetailButtonState),
              width: 17,
              height: 17,
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
      EventState.paymentNeeded: PrimaryButton(
        onTap: () {},
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
      EventState.awaiting: PrimaryButton(
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
      EventState.approved: PrimaryButton(
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
    };

    return Container(
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
          Stack(
            alignment: Alignment.center,
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
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 16,
                  height: 19,
                  child: detailCardStates[state],
                ),
              ),
            ],
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
              const SizedBox(
                width: 2,
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
              const SizedBox(
                width: 2,
              ),
              Row(
                children: <Widget>[
                  GradinetLeftToRight(
                    blendMode: BlendMode.srcIn,
                    color: colorService.primaryGradient(),
                    child: SizedBox(
                      width: widthInfoIcon,
                      height: heightInfoIcon + 3,
                      child: Image.asset(
                        A.assetsEventPriceIcon,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    price,
                    style: infoTextStyle,
                  ),
                ],
              ),
              const SizedBox(
                width: 2,
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
              const SizedBox(
                width: 2,
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
              const SizedBox(
                width: 2,
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
            child: MapBlock(
              onTap: onMapTap,
              height: 180,
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
          detailButtonStates[state]!,
          SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Конец регистрации: ${endRegistration}',
              style: descriptionTextStyle.copyWith(fontStyle: FontStyle.italic),
            ),
          ),
        ],
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
  final String description;
  final String endRegistration;
  final EventState state;
  final String price;

  DetailCardDesktop({
    Key? key,
    required this.onTap,
    required this.title,
    required this.date,
    required this.ageLimit,
    required this.eventType,
    required this.locationType,
    required this.location,
    required this.description,
    required this.endRegistration,
    this.state = EventState.notParticipated,
    required this.price,
  }) : super(key: key);

  final colorService = Injector().get<ColorService>();

  final TextStyle detailButtonTextStyle =
      TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    final Map<EventState, Widget> detailCardStates = {
     EventState.notParticipated: Image.asset(
        A.assetsParticipateDetailButtonState,
        color: colorService.primaryColor(),
      ),
      EventState.paymentNeeded: Image.asset(
        A.assetsScanShareDetailButtonState,
        color: colorService.logOutBottomColor(),
      ),
      EventState.awaiting: Image.asset(
        A.assetsInProgressDetailButtonState,
        color: colorService.inProgressEventCardStateColor(),
      ),
      EventState.approved: Image.asset(
        A.assetsBookedDetailButtonState,
        color: colorService.doneEventCardStateColor(),
      ),
    };
    final Map<EventState, Widget> detailButtonStates = {
      EventState.notParticipated: PrimaryButton(
        onTap: onTap,
        gradient: colorService.primaryGradient(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset(A.assetsParticipateDetailButtonState),
              width: 17,
              height: 17,
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
      EventState.paymentNeeded: PrimaryButton(
        onTap: () {},
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
      EventState.awaiting: PrimaryButton(
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
      EventState.approved: PrimaryButton(
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
    };

    final TextStyle infoTextStyle = TextStyle(
        fontSize: 14,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
        color: colorService.cardInfoTextColor());

    final TextStyle descriptionTextStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: colorService.cardTitleTextColor());

    final columnWidth = widthColumnDetailPageDesktop(context);
    const double widthInfoIcon = 14;
    const double heightInfoIcon = 14;

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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        child: detailCardStates[state]!,
                      )
                    ],
                  ),
                  const SizedBox(
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
                  const SizedBox(
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
                  const SizedBox(
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
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: <Widget>[
                      GradinetLeftToRight(
                        blendMode: BlendMode.srcIn,
                        color: colorService.primaryGradient(),
                        child: SizedBox(
                          width: widthInfoIcon,
                          height: heightInfoIcon + 3,
                          child: Image.asset(
                            A.assetsEventPriceIcon,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        price,
                        style: infoTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
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
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: columnWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MapBlock(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            S.current.mapUnavailableError,
                            textAlign: TextAlign.center,
                          ),
                          behavior: SnackBarBehavior.floating,
                        ));
                      },
                      height: 185),
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
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                          width: widthInfoIcon,
                          height: heightInfoIcon,
                          child:
                              Image.asset(A.assetsCardSecondaryLocationIcon)),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        location,
                        style: infoTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      detailButtonStates[state]!,
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Конец регистрации: $endRegistration',
                        style: descriptionTextStyle.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
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
