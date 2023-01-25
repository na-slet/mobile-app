import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:intl/intl.dart';

import '../../../generated/l10n.dart';
import '../../../services/ColorService.dart';
import '../../../services/GradientService.dart';
import '../../../ui/Cards.dart';
import '../../../utils/Assets.dart';
import '../../../utils/Routes.dart';
import '../details/DetailsPage.dart';
import 'bloc/events_bloc.dart';

class EventsPageMobile extends StatelessWidget {
  EventsPageMobile({Key? key}) : super(key: key);
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

    return BlocBuilder<EventsBloc, EventsState>(
      builder: (context, state) {
        return Stack(
          children: <Widget>[
            SizedBox(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GradinetLeftToRight(
                          blendMode: BlendMode.srcIn,
                          color: colorService.primaryGradient(),
                          child: Text(
                            S.current.eventsPageTittleText,
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
                    (state is EventsLoaded)
                        ? ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.events.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 20,
                            ),
                            itemBuilder: (context, i) => PrimaryCard(
                              onTap: () {
                                Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (context) => DetailsPage(
                                          event: state.events[i],
                                        )));
                              },
                              imgPath: 'static/4-orange.png',
                              state: (state.events[i].stage == 'APPROVED')
                                  ? eventCardStates[2]
                                  : eventCardStates[1],
                              title:
                                  '${state.events[i].categoryType.name} «${state.events[i].name}»',
                              date:
                                  '${DateFormat('dd MMMM').format(state.events[i].startDate)} — ${DateFormat('dd MMMM yyyy').format(state.events[i].endDate)}',
                              ageLimit:
                                  'от ${state.events[i].minAge} до ${state.events[i].maxAge} лет',
                              location:
                                  '${state.events[i].city}, ${state.events[i].union.shortName}',
                              description: state.events[i].shortDescription,
                            ),
                          )
                        : const CupertinoActivityIndicator(),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
