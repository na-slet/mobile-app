import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../ui/Cards.dart';
import '../../../utils/ScreenSize.dart';
import '../../../utils/Assets.dart';

class FeedPageDesktop extends StatelessWidget {
  const FeedPageDesktop({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: FractionallySizedBox(
        widthFactor: widthFactorFeedPageDesktop(context),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05, vertical: 25),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        S.current.feedPageTittleText,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            PrimaryCard(
                              onTap: () {},
                              imgPath: A.assetsPrimaryCardRightArrowIcon,
                              title: '123',
                              date: '123',
                              ageLimit: '123',
                              location: '123',
                              description: '123',
                            ),
                            PrimaryCard(
                              onTap: () {},
                              imgPath: A.assetsPrimaryCardRightArrowIcon,
                              title: '123',
                              date: '123',
                              ageLimit: '123',
                              location: '123',
                              description: '123',
                            ),
                            PrimaryCard(
                              onTap: () {},
                              imgPath: A.assetsPrimaryCardRightArrowIcon,
                              title: '123',
                              date: '123',
                              ageLimit: '123',
                              location: '123',
                              description: '123',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          children: [
                            PrimaryCard(
                              onTap: () {},
                              imgPath: A.assetsPrimaryCardRightArrowIcon,
                              title: '123',
                              date: '123',
                              ageLimit: '123',
                              location: '123',
                              description: '123',
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
