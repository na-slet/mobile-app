import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:intl/intl.dart';

import '../../../generated/l10n.dart';
import '../../../models/Event.dart';
import '../../../models/EventState.dart';
import '../../../services/ColorService.dart';
import '../../../services/GradientService.dart';
import '../../../ui/Buttons.dart';
import '../../../ui/Cards.dart';
import '../../../utils/Assets.dart';
import '../../../utils/ScreenSize.dart';
import 'bloc/detail_bloc.dart';

class DetailsPageDesktop extends StatefulWidget {
  final Event event;
  final DetailState state;
  final colorService = Injector().get<ColorService>();

  DetailsPageDesktop({Key? key, required this.event, required this.state})
      : super(key: key);

  @override
  State<DetailsPageDesktop> createState() => _DetailsPageDesktopState();
}

class _DetailsPageDesktopState extends State<DetailsPageDesktop> {
  bool isTaped = false;

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
                            widthImg: 25,
                            heightImg: 20,
                            imgPath: A.assetsDetailsPageArrowBackIcon,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 40,
                            child: GradinetLeftToRight(
                              blendMode: BlendMode.srcIn,
                              color: widget.colorService.primaryGradient(),
                              child: Text(
                                S.current.detailPageTittleText,
                                style: TextStyle(
                                  color: widget.colorService.primaryColor(),
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
                    latitude: widget.event.latitude,
                    longitude: widget.event.longitude,
                    onTap: (isTaped)
                        ? () {
                            context
                                .read<DetailBloc>()
                                .add(DetailPaymentEvent());
                          }
                        : () {
                            context
                                .read<DetailBloc>()
                                .add(DetailParticipateEvent());
                            setState(() {
                              isTaped = true;
                            });
                          },
                    state: context.read<DetailBloc>().eventState,
                    title:
                        '${widget.event.categoryType.name} «${widget.event.name}»',
                    date:
                        '${DateFormat('dd MMMM').format(widget.event.startDate)} — ${DateFormat('dd MMMM yyyy').format(widget.event.endDate)}',
                    ageLimit:
                        'от ${widget.event.minAge} до ${widget.event.maxAge} лет',
                    eventType:
                        '${widget.event.eventType.name} ${widget.event.categoryType.name.toLowerCase()}',
                    locationType: widget.event.union.name,
                    location: '${widget.event.address}, ${widget.event.city}',
                    price: '${widget.event.price} ₽',
                    description: widget.event.description,
                    endRegistration: DateFormat('dd MMMM yyyy')
                        .format(widget.event.regEndDate),
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
