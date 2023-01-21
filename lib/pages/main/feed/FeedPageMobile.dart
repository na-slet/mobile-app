import 'package:flutter/material.dart';

import '../../../utils/Assets.dart';

class FeedPageMobile extends StatelessWidget {
  const FeedPageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            A.assetsBackgroundFeed,
            fit: BoxFit.fitWidth,
          ),
        )
      ],
    );
  }
}
