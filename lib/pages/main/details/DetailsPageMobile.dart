import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:intl/intl.dart';
import 'package:naslet/models/EventState.dart';
import 'package:naslet/utils/Routes.dart';

import '../../../generated/l10n.dart';
import '../../../models/Event.dart';
import '../../../services/ColorService.dart';
import '../../../services/GradientService.dart';
import '../../../ui/Buttons.dart';
import '../../../ui/Cards.dart';
import '../../../ui/Map.dart';
import '../../../utils/Assets.dart';
import 'bloc/detail_bloc.dart';

class DetailsPageMobile extends StatelessWidget {
  final colorService = Injector().get<ColorService>();
  final Event event;

  DetailsPageMobile({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailBloc, DetailState>(
      listener: (context, state) {
        if (state is DetailSuccess) {
          _showSnackBar(context: context, text: state.message);
          Navigator.pop(context);
        } else if (state is DetailError) {
          _showSnackBar(context: context, text: state.message);
        }
      },
      builder: (context, state) {
        return Stack(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 1.2,
              width: double.infinity,
              child: Image.asset(
                A.assetsBackgroundFeed,
                fit: BoxFit.fitWidth,
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 27, vertical: 30),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ImgCircleButton(
                              onTap: () => Navigator.pop(context),
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
                                color: colorService.primaryGradient(),
                                child: Text(
                                  S.current.detailPageTittleText,
                                  style: TextStyle(
                                    color: colorService.primaryColor(),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
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
                    DetailCard(
                      onTap: (state is DetailLoading)
                          ? () {}
                          : () {
                              context
                                  .read<DetailBloc>()
                                  .add(DetailParticipateEvent());
                            },
                      onMapTap: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            S.current.mapUnavailableError,
                            textAlign: TextAlign.center,
                          ),
                          behavior: SnackBarBehavior.floating,
                        ),
                      ),
                      // onMapTap: () => Navigator.push(
                      //   context,
                      //   CupertinoModalPopupRoute(
                      //     builder: (context) => MapOpendBlock(
                      //       onTapCloseButton: () {
                      //         Navigator.pop(context);
                      //       },
                      //     ),
                      //   ),
                      // ),
                      state: event.state ?? EventState.notParticipated,
                      title: '${event.categoryType.name} «${event.name}»',
                      date:
                          '${DateFormat('dd MMMM').format(event.startDate)} — ${DateFormat('dd MMMM yyyy').format(event.endDate)}',
                      ageLimit: 'от ${event.minAge} до ${event.maxAge} лет',
                      eventType:
                          '${event.eventType.name} ${event.categoryType.name.toLowerCase()}',
                      locationType: event.union.name,
                      location: '${event.address}, ${event.city}',
                      price: '${event.price} ₽',
                      description: event.description,
                      endRegistration:
                          DateFormat('dd MMMM yyyy').format(event.regEndDate),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  _showSnackBar({required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
    ));
  }
}
