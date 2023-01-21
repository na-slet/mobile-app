import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:naslet_mobile/ui/Buttons.dart';

import '../../../generated/l10n.dart';
import '../../../services/ColorService.dart';
import '../../../services/GradientService.dart';
import '../../../ui/Fields.dart';
import '../../../utils/Assets.dart';

class ProfilePageMobile extends StatelessWidget {
  ProfilePageMobile({Key? key}) : super(key: key);

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
    double deviceWidth = MediaQuery.of(context).size.width - 2 * 28;
    double dateFieldWidth = 68; //deviceWidth * 0.25;
    double monthFieldWidth = 136; //deviceWidth * 0.5;
    double yearFieldWidth = 68; //deviceWidth * 0.25;

    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: GradinetLeftToRight(
                      blendMode: BlendMode.srcIn,
                      color: colorService.primaryGradient(),
                      child: Text(
                        S.current.profilePageTitleText,
                        style: TextStyle(
                          color: colorService.primaryColor(),
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: ImgCircleButton(
                      onTap: () {},
                      width: 40,
                      height: 40,
                      widthImg: 18,
                      heightImg: 12,
                      imgPath: A.assetsProfilePageDoneMarkIcon,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 208,
                height: 208,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: 195,
                      height: 195,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color:
                                colorService.profilePageAvatarBoxShadowColor(),
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
              const SizedBox(
                height: 20,
              ),
              ProfilePageTextField(
                controller: _textFormSurnameController,
                lableText: S.current.profilePageSurnameFieldLabelText,
                hintText: S.current.profilePageSurnameFieldHintText,
              ),
              const SizedBox(
                height: 5,
              ),
              ProfilePageTextField(
                controller: _textFormNameController,
                lableText: S.current.profilePageNameFieldHintText,
                hintText: S.current.profilePageNameFieldLabelText,
              ),
              const SizedBox(
                height: 5,
              ),
              ProfilePageTextField(
                controller: _textFormPatronymicController,
                lableText: S.current.profilePagePatronymicFieldLabelText,
                hintText: S.current.profilePagePatronymicFieldHintText,
              ),
              const SizedBox(
                height: 5,
              ),
              ProfilePageTextField(
                controller: _textFormContactController,
                lableText: S.current.profilePageContactFieldLabelText,
                hintText: S.current.profilePageContactFieldHintText,
              ),
              const SizedBox(
                height: 5,
              ),
              ProfilePageTextField(
                controller: _textFormEmailController,
                lableText: S.current.profilePageEmailFieldLabelText,
                hintText: S.current.profilePageEmailFieldHintText,
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
                      color: colorService.profilePageTexFieldHintColor(),
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
                height: 5,
              ),
              ProfilePageTextField(
                controller: _textFormInitialsController,
                lableText: S.current.profilePageInitialsFieldLabelText,
                hintText: S.current.profilePageInitialsFieldHintText,
              ),
              const SizedBox(
                height: 5,
              ),
              ProfilePageTextField(
                controller: _textFormParentsContactController,
                lableText: S.current.profilePageParentsContactFieldLabelText,
                hintText: S.current.profilePageParentsContactFieldHintText,
              ),
              const SizedBox(
                height: 5,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    S.current.profilePageUnificationFieldLabelText,
                    style: TextStyle(
                      color: colorService.profilePageTexFieldHintColor(),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  DropdownField(
                    hintAlignment: Alignment.centerLeft,
                    hintPadding: EdgeInsets.only(left: 10),
                    buttonWidth: deviceWidth,
                    buttonHeight: 35,
                    items: unification,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              ProfilePageTextField(
                controller: _textFormCityController,
                lableText: S.current.profilePageCityFieldLabelText,
                hintText: S.current.profilePageCityFieldHintText,
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
            ],
          ),
        ),
      ),
    );
  }
}
