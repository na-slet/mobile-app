import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../../generated/l10n.dart';
import '../../../services/ColorService.dart';
import '../../../ui/Buttons.dart';
import '../../../ui/Fields.dart';
import '../../../utils/Assets.dart';
import '../../../utils/ScreenSize.dart';

class ProfilePageDesktop extends StatelessWidget {
  ProfilePageDesktop({Key? key}) : super(key: key);

  final colorService = Injector().get<ColorService>();

  final _textFormSurnameController = TextEditingController();
  final _textFormNameController = TextEditingController();
  final _textFormPatronymicController = TextEditingController();
  final _textFormContactController = TextEditingController();
  final _textFormEmailController = TextEditingController();
  final _textFormInitialsController = TextEditingController();
  final _textFormParentsContactController = TextEditingController();
  final _textFormCityController = TextEditingController();
  final _textFormUnificationController = TextEditingController();

  List<String> dateList = List<String>.generate(31, (i) => (i + 1).toString());
  List<String> monthList = [
    S.current.January,
    S.current.February,
    S.current.March,
    S.current.April,
    S.current.May,
    S.current.June,
    S.current.July,
    S.current.August,
    S.current.September,
    S.current.October,
    S.current.November,
    S.current.December,
  ];
  List<String> yearList = List<String>.generate(
      (DateTime.now().year - 1900) + 1,
      (index) => (DateTime.now().year - index).toString());
  List<String> unification = [S.current.profilePageUnificationFieldHintText];

  @override
  Widget build(BuildContext context) {
    double? columnWidth = setColumnWidthProfilePageDesktop(context);
    double dateFieldWidth =
        setDateDropDownWidthProfilePageDesktop(context); //deviceWidth * 0.25;
    double monthFieldWidth = dateFieldWidth * 1.35; //deviceWidth * 0.5;
    double yearFieldWidth = dateFieldWidth; //deviceWidth * 0.25;

    return FractionallySizedBox(
      widthFactor: widthFactorProfilePageDesktop(context),
      heightFactor: heightFactorProfilePageDesktop(context),
      alignment: const Alignment(0, -0.9),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    S.current.profilePageTitleText,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    width: 19,
                  ),
                  ImgCircleButton(
                    onTap: () {},
                    width: 40,
                    height: 40,
                    widthImg: 18,
                    heightImg: 12,
                    imgPath: A.assetsProfilePageDoneMarkIcon,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: columnWidth,
                    child: Column(
                      children: [
                        ProfilePageTextField(
                          controller: _textFormSurnameController,
                          hintText: S.current.profilePageSurnameFieldHintText,
                          lableText: S.current.profilePageSurnameFieldLabelText,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ProfilePageTextField(
                          controller: _textFormNameController,
                          hintText: S.current.profilePageNameFieldHintText,
                          lableText: S.current.profilePageNameFieldLabelText,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ProfilePageTextField(
                          controller: _textFormPatronymicController,
                          hintText:
                              S.current.profilePagePatronymicFieldHintText,
                          lableText:
                              S.current.profilePagePatronymicFieldLabelText,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 190,
                    height: 190,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            color: const Color(0xFFA3A3A3),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: colorService
                                    .profilePageAvatarBoxShadowColor(),
                                spreadRadius: 0,
                                blurRadius: 25,
                                offset: const Offset(
                                    0, 8), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        Align(
                            alignment: const Alignment(1, 1),
                            child: EditButton(
                                onTap: () {},
                                color: colorService.primaryColor(),
                                imgPath: A.assetsProfilePagePencileIcon))
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: columnWidth,
                    child: Column(
                      children: [
                        ProfilePageTextField(
                          controller: _textFormContactController,
                          hintText: S.current.profilePageContactFieldHintText,
                          lableText: S.current.profilePageContactFieldLabelText,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ProfilePageTextField(
                          controller: _textFormEmailController,
                          hintText: S.current.profilePageEmailFieldHintText,
                          lableText: S.current.profilePageEmailFieldLabelText,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.current.profilePageBirthDateFieldLabelText,
                              style: TextStyle(
                                color:
                                    colorService.profilePageTexFieldHintColor(),
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                DropdownField(
                                  buttonWidth: dateFieldWidth,
                                  buttonHeight: 35,
                                  items: dateList,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                DropdownField(
                                  buttonWidth: monthFieldWidth,
                                  buttonHeight: 35,
                                  items: monthList,
                                  hintAlignment: Alignment.center,
                                  // hintPadding: const EdgeInsets.only(left: 5),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                DropdownField(
                                  buttonWidth: yearFieldWidth,
                                  buttonHeight: 35,
                                  items: yearList,
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ProfilePageTextField(
                          controller: _textFormInitialsController,
                          hintText: S.current.profilePageInitialsFieldHintText,
                          lableText:
                              S.current.profilePageInitialsFieldLabelText,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: columnWidth,
                    child: Column(
                      children: [
                        ProfilePageTextField(
                          controller: _textFormUnificationController,
                          hintText:
                              S.current.profilePageUnificationFieldHintText,
                          lableText:
                              S.current.profilePageUnificationFieldLabelText,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ProfilePageTextField(
                          controller: _textFormCityController,
                          hintText: S.current.profilePageCityFieldHintText,
                          lableText: S.current.profilePageCityFieldLabelText,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        PrimaryButton(
                          onTap: () {},
                          height: 41,
                          title: S.current.logOutButtonText,
                          gradient: colorService.logOutGradient(),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                        ProfilePageTextField(
                          controller: _textFormParentsContactController,
                          hintText:
                              S.current.profilePageParentsContactFieldHintText,
                          lableText:
                              S.current.profilePageParentsContactFieldLabelText,
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
    );
  }
}
