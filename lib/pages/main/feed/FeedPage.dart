import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/ScreenSize.dart';
import 'FeedPageDesktop.dart';
import 'FeedPageMobile.dart';
import 'bloc/feed_bloc.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeedBloc(),
      child: LayoutBuilder(builder: (context, constraints) {
        context.read<FeedBloc>().add(FeedLoadEvent());
        if (MediaQuery.of(context).size.width < WidthFormFactor.tablet) {
          return FeedPageMobile();
        } else {
          return FeedPageDesktop();
        }
      }),
    );
  }
}
