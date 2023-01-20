import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../utils/Assets.dart';

class ProfilePageMobile extends StatelessWidget {
  const ProfilePageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(S.current.profilePageTitle),
            Spacer(),
            Container(
              width: 18,
              height: 12,
              child: Image.asset(A.assetsProfilePageDoneMarkIcon),
            )
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          width: 195,
          height: 195,
        )
      ],
    );
  }
}
