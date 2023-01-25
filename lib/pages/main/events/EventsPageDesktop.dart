import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';

import '../../../generated/l10n.dart';
import '../../../services/ColorService.dart';
import '../../../ui/Cards.dart';
import '../../../utils/Assets.dart';
import '../../../utils/ScreenSize.dart';
import '../details/DetailsPage.dart';
import 'bloc/events_bloc.dart';

class EventsPageDesktop extends StatelessWidget {
  EventsPageDesktop({Key? key}) : super(key: key);

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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            S.current.eventsPageTittleText,
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
                      (state is EventsLoaded)
                          ? StaggeredGrid.count(
                              crossAxisCount: 2,
                              children: List<Widget>.generate(
                                state.events.length,
                                (i) => PrimaryCard(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      CupertinoPageRoute(
                                          builder: (context) => DetailsPage(
                                                event: state.events[i],
                                              )),
                                    );
                                  },
                                  state: (state.events[i].stage == 'APPROVED')
                                      ? eventCardStates[2]
                                      : eventCardStates[1],
                                  imgPath: 'static/4-orange.png',
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
                              ))
                          : const Center(
                              child: CupertinoActivityIndicator(),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
