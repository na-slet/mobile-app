import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../../generated/l10n.dart';
import '../../../models/Union.dart';
import '../../../services/ColorService.dart';
import '../../../services/GradientService.dart';
import '../../../ui/Buttons.dart';
import '../../../ui/Fields.dart';
import '../../../utils/Assets.dart';
import '../../../utils/Routes.dart';
import 'bloc/profile_bloc.dart';

class ProfilePageMobile extends StatelessWidget {
  final dynamic state;

  ProfilePageMobile({Key? key, required this.state}) : super(key: key);

  final colorService = Injector().get<ColorService>();
  final _textFormSurnameController = TextEditingController();
  final _textFormNameController = TextEditingController();
  final _textFormPatronymicController = TextEditingController();
  final _textFormContactController = TextEditingController();
  final _textFormEmailController = TextEditingController();
  final _textFormInitialsController = TextEditingController();
  final _textFormParentsContactController = TextEditingController();
  final _textFormCityController = TextEditingController();

  List<String> dateList = List<String>.generate(
      31,
      (i) => ((i + 1).toString().length == 1)
          ? '0${(i + 1).toString()}'
          : (i + 1).toString());

  Map<String, String> monthList = {
    '01': S.current.january,
    '02': S.current.february,
    '03': S.current.march,
    '04': S.current.april,
    '05': S.current.may,
    '06': S.current.june,
    '07': S.current.july,
    '08': S.current.august,
    '09': S.current.september,
    '10': S.current.october,
    '11': S.current.november,
    '12': S.current.december,
  };

  List<String> yearList = List<String>.generate(
      (DateTime.now().year - 1900) + 1,
      (index) => (DateTime.now().year - index).toString());

  List<String> unification = [
    for (var union in Union.allUnions.values) union.name
  ];

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width - 2 * 28;
    double dateFieldWidth = (deviceWidth - 16) * 0.25 - 3;
    double monthFieldWidth = (deviceWidth - 16) * 0.5 - 3;
    double yearFieldWidth = (deviceWidth - 16) * 0.25 - 3;
    String dateListActive = dateList[0];
    String monthListActive = monthList['01']!;
    String yearListActive = yearList[0];
    String unificationActive = unification[0];
    DropdownFieldController dateController =
        DropdownFieldController(items: dateList, selectedValue: dateListActive);
    DropdownFieldController monthController = DropdownFieldController(
        items: monthList.values.toList(), selectedValue: monthListActive);
    DropdownFieldController yearController =
        DropdownFieldController(items: yearList, selectedValue: yearListActive);
    DropdownFieldController unificationController = DropdownFieldController(
        items: unification, selectedValue: unificationActive);

    if (state is ProfileLoaded) {
      _textFormNameController.text = state.user.firstName ?? '';
      _textFormSurnameController.text = state.user.lastName ?? '';
      _textFormPatronymicController.text = state.user.middleName ?? '';
      _textFormCityController.text = state.user.city ?? '';
      _textFormContactController.text = state.user.phone ?? '';
      _textFormParentsContactController.text = state.user.parentPhone ?? '';
      _textFormInitialsController.text = state.user.parentFIO ?? '';
      _textFormEmailController.text = state.user.email;

      if (state.user.birthDate != null) {
        List<String> birthDate = state.user.birthDate!.split('-');

        dateListActive = birthDate[2];
        monthListActive = monthList[birthDate[1]]!;
        yearListActive = birthDate[0];
      }

      unificationActive =
          (state.user.union != null) ? state.user.union!.name : unification[0];

      dateController.setValue(dateListActive);
      monthController.setValue(monthListActive);
      yearController.setValue(yearListActive);
      unificationController.setValue(unificationActive);
    }

    return SingleChildScrollView(
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
                    onTap: () {
                      context.read<ProfileBloc>().add(ProfileLogoutEvent());
                    },
                    width: 40,
                    height: 40,
                    widthImg: 14,
                    heightImg: 18,
                    imgPath: A.assetsProfilePageLeaveIcon,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            (state is ProfileLoading)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(S.current.updating),
                      const SizedBox(
                        height: 4,
                      ),
                      const CupertinoActivityIndicator(),
                    ],
                  )
                : Column(
                    children: <Widget>[
                      Container(
                        width: 208,
                        height: 208,
                        decoration: BoxDecoration(
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
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: (state is ProfileLoaded)
                                    ? Image.network(
                                        state.user.avatar,
                                        fit: BoxFit.fill,
                                      )
                                    : Image.asset(
                                        A.assetsProfilePageAvatarImage,
                                        fit: BoxFit.fill,
                                      ),
                              ),
                            ),
                            Align(
                                alignment: const Alignment(1, 1),
                                child: EditButton(
                                    onTap: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            S.current.avatarChangingError,
                                            textAlign: TextAlign.center,
                                          ),
                                          behavior: SnackBarBehavior.floating,
                                        ),
                                      );
                                    },
                                    color: colorService.primaryColor(),
                                    imgPath: A.assetsProfilePagePencileIcon))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ProfilePageTextField(
                        textInputType: TextInputType.text,
                        controller: _textFormSurnameController,
                        lableText: S.current.profilePageSurnameFieldLabelText,
                        hintText: S.current.profilePageSurnameFieldHintText,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ProfilePageTextField(
                        textInputType: TextInputType.text,
                        controller: _textFormNameController,
                        lableText: S.current.profilePageNameFieldLabelText,
                        hintText: S.current.profilePageNameFieldHintText,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ProfilePageTextField(
                        textInputType: TextInputType.text,
                        controller: _textFormPatronymicController,
                        lableText:
                            S.current.profilePagePatronymicFieldLabelText,
                        hintText: S.current.profilePagePatronymicFieldHintText,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ProfilePageTextField(
                        textInputType: TextInputType.phone,
                        controller: _textFormContactController,
                        lableText: S.current.profilePageContactFieldLabelText,
                        hintText: S.current.profilePageContactFieldHintText,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ProfilePageTextField(
                        textInputType: TextInputType.emailAddress,
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
                                controller: dateController,
                                hintPadding: const EdgeInsets.only(left: 12),
                                textColor:
                                    colorService.signInScreenTitleColor(),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              DropdownField(
                                buttonWidth: monthFieldWidth,
                                buttonHeight: 35,
                                controller: monthController,
                                hintPadding: const EdgeInsets.only(left: 12),
                                textColor:
                                    colorService.signInScreenTitleColor(),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              DropdownField(
                                buttonWidth: yearFieldWidth,
                                buttonHeight: 35,
                                controller: yearController,
                                hintPadding: const EdgeInsets.only(left: 9),
                                textColor:
                                    colorService.signInScreenTitleColor(),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ProfilePageTextField(
                        textInputType: TextInputType.text,
                        controller: _textFormInitialsController,
                        lableText: S.current.profilePageInitialsFieldLabelText,
                        hintText: S.current.profilePageInitialsFieldHintText,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ProfilePageTextField(
                        textInputType: TextInputType.phone,
                        controller: _textFormParentsContactController,
                        lableText:
                            S.current.profilePageParentsContactFieldLabelText,
                        hintText:
                            S.current.profilePageParentsContactFieldHintText,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          S.current.profilePageUnificationFieldLabelText,
                          style: TextStyle(
                            color: colorService.profilePageTexFieldHintColor(),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DropdownField(
                        hintAlignment: Alignment.centerLeft,
                        hintPadding: const EdgeInsets.only(left: 10),
                        buttonWidth: deviceWidth,
                        buttonHeight: 35,
                        controller: unificationController,
                        textColor: colorService.profilePageTexFieldHintColor(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ProfilePageTextField(
                        textInputType: TextInputType.text,
                        controller: _textFormCityController,
                        lableText: S.current.profilePageCityFieldLabelText,
                        hintText: S.current.profilePageCityFieldHintText,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PrimaryButton(
                        onTap: () {
                          context.read<ProfileBloc>().add(ProfileUpdateUser(
                              firstName: _textFormNameController.value.text,
                              lastName: _textFormSurnameController.value.text,
                              middleName:
                                  _textFormPatronymicController.value.text,
                              phone: _textFormContactController.value.text,
                              parentPhone:
                                  _textFormParentsContactController.value.text,
                              parentFIO:
                                  '${_textFormInitialsController.value.text}  ',
                              email: _textFormEmailController.value.text,
                              city: _textFormCityController.value.text,
                              birthDate:
                                  '${yearController.selectedValue}-${monthList.keys.firstWhere((k) => monthList[k] == monthController.selectedValue)}-${dateController.selectedValue}',
                              union: Union.allUnions.values
                                  .firstWhere((element) =>
                                      element.name ==
                                      unificationController.selectedValue)
                                  .id));
                        },
                        height: 41,
                        title: S.current.profilePageSaveButtonText,
                        gradient: colorService.bookedGradient(),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
