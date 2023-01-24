import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../../generated/l10n.dart';
import '../../../models/Union.dart';
import '../../../services/ColorService.dart';
import '../../../ui/Buttons.dart';
import '../../../ui/Fields.dart';
import '../../../utils/Assets.dart';
import '../../../utils/Routes.dart';
import '../../../utils/ScreenSize.dart';
import 'bloc/profile_bloc.dart';

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

  List<String> dateList = List<String>.generate(
      31,
      (i) => ((i + 1).toString().length == 1)
          ? '0${(i + 1).toString()}'
          : (i + 1).toString());
  Map<String, String> monthList = {
    '01': S.current.January,
    '02': S.current.February,
    '03': S.current.March,
    '04': S.current.April,
    '05': S.current.May,
    '06': S.current.June,
    '07': S.current.July,
    '08': S.current.August,
    '09': S.current.September,
    '10': S.current.October,
    '11': S.current.November,
    '12': S.current.December,
  };
  List<String> yearList = List<String>.generate(
      (DateTime.now().year - 1900) + 1,
      (index) => (DateTime.now().year - index).toString());
  List<String> unification = [
    for (var union in Union.allUnions.values) union.name
  ];

  @override
  Widget build(BuildContext context) {
    double? columnWidth = setColumnWidthProfilePageDesktop(context);
    double dateFieldWidth = (columnWidth! - 16) * 0.25 - 3;
    double monthFieldWidth = (columnWidth - 16) * 0.5 - 3;
    double yearFieldWidth = (columnWidth - 16) * 0.25 - 3;
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

    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLogoutState) {
          Navigator.of(context, rootNavigator: true)
              .pushNamedAndRemoveUntil(Routes.signInPage, (route) => false);
        }
      },
      builder: (context, state) {
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

          unificationActive = (state.user.union != null)
              ? state.user.union!.name
              : unification[0];

          dateController.setValue(dateListActive);
          monthController.setValue(monthListActive);
          yearController.setValue(yearListActive);
          unificationController.setValue(unificationActive);
        }

        return Padding(
          padding: const EdgeInsets.only(top: 25),
          child: FractionallySizedBox(
            widthFactor: widthFactorProfilePageDesktop(context),
            heightFactor: heightFactorProfilePageDesktop(context),
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: (state is ProfileLoading)
                  ? const Center(child: CupertinoActivityIndicator())
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 25),
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
                                  width: 20,
                                ),
                                ImgCircleButton(
                                  onTap: () {
                                    context.read<ProfileBloc>().add(ProfileUpdateUser(
                                        firstName:
                                            _textFormNameController.value.text,
                                        lastName: _textFormSurnameController
                                            .value.text,
                                        middleName:
                                            _textFormPatronymicController
                                                .value.text,
                                        phone: _textFormContactController
                                            .value.text,
                                        parentPhone:
                                            _textFormParentsContactController
                                                .value.text,
                                        parentFIO: _textFormInitialsController
                                            .value.text,
                                        email:
                                            _textFormEmailController.value.text,
                                        city:
                                            _textFormCityController.value.text,
                                        birthDate:
                                            '${yearController.selectedValue}-${monthList.keys.firstWhere((k) => monthList[k] == monthController.selectedValue)}-${dateController.selectedValue}',
                                        union: Union.allUnions.values
                                            .firstWhere((element) =>
                                                element.name ==
                                                unificationController
                                                    .selectedValue)
                                            .id));
                                  },
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
                              children: <Widget>[
                                SizedBox(
                                  width: columnWidth,
                                  child: Column(
                                    children: <Widget>[
                                      ProfilePageTextField(
                                        controller: _textFormSurnameController,
                                        hintText: S.current
                                            .profilePageSurnameFieldHintText,
                                        lableText: S.current
                                            .profilePageSurnameFieldLabelText,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ProfilePageTextField(
                                        controller: _textFormNameController,
                                        hintText: S.current
                                            .profilePageNameFieldHintText,
                                        lableText: S.current
                                            .profilePageNameFieldLabelText,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ProfilePageTextField(
                                        controller:
                                            _textFormPatronymicController,
                                        hintText: S.current
                                            .profilePagePatronymicFieldHintText,
                                        lableText: S.current
                                            .profilePagePatronymicFieldLabelText,
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      ProfilePageTextField(
                                        controller: _textFormContactController,
                                        hintText: S.current
                                            .profilePageContactFieldHintText,
                                        lableText: S.current
                                            .profilePageContactFieldLabelText,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      ProfilePageTextField(
                                        controller: _textFormEmailController,
                                        hintText: S.current
                                            .profilePageEmailFieldHintText,
                                        lableText: S.current
                                            .profilePageEmailFieldLabelText,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            S.current
                                                .profilePageBirthDateFieldLabelText,
                                            style: TextStyle(
                                              color: colorService
                                                  .profilePageTexFieldHintColor(),
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
                                                hintPadding:
                                                    const EdgeInsets.only(
                                                        left: 12),
                                                hintAlignment:
                                                    Alignment.centerLeft,
                                                textColor: colorService
                                                    .signInScreenTitleColor(),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              DropdownField(
                                                buttonWidth: monthFieldWidth,
                                                buttonHeight: 35,
                                                controller: monthController,
                                                hintAlignment:
                                                    Alignment.centerLeft,
                                                hintPadding:
                                                    const EdgeInsets.only(
                                                        left: 12),
                                                textColor: colorService
                                                    .signInScreenTitleColor(),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              DropdownField(
                                                buttonWidth: yearFieldWidth,
                                                buttonHeight: 35,
                                                controller: yearController,
                                                hintPadding:
                                                    const EdgeInsets.only(
                                                        left: 12),
                                                hintAlignment:
                                                    Alignment.centerLeft,
                                                textColor: colorService
                                                    .signInScreenTitleColor(),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 38,
                                      ),
                                      ProfilePageTextField(
                                        controller: _textFormInitialsController,
                                        hintText: S.current
                                            .profilePageInitialsFieldHintText,
                                        lableText: S.current
                                            .profilePageInitialsFieldLabelText,
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: columnWidth,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        width: 190,
                                        height: 190,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: colorService
                                                  .profilePageAvatarBoxShadowColor(),
                                              spreadRadius: 0,
                                              blurRadius: 25,
                                              offset: const Offset(0, 8),
                                            ),
                                          ],
                                        ),
                                        child: Stack(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  A.assetsProfilePageAvatarImage,
                                                  fit: BoxFit.fill,
                                                  width: 180,
                                                  height: 180,
                                                ),
                                              ),
                                            ),
                                            Align(
                                                alignment:
                                                    const Alignment(1, 1),
                                                child: EditButton(
                                                    onTap: () {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              SnackBar(
                                                        content: Text(
                                                          S.current
                                                              .avatarChangingError,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                      ));
                                                    },
                                                    color: colorService
                                                        .primaryColor(),
                                                    imgPath: A
                                                        .assetsProfilePagePencileIcon))
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          S.current
                                              .profilePageUnificationFieldLabelText,
                                          style: TextStyle(
                                            color: colorService
                                                .profilePageTexFieldHintColor(),
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
                                        hintPadding:
                                            const EdgeInsets.only(left: 10),
                                        buttonWidth: columnWidth,
                                        buttonHeight: 35,
                                        controller: unificationController,
                                        textColor: colorService
                                            .profilePageTexFieldHintColor(),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      ProfilePageTextField(
                                        controller: _textFormCityController,
                                        hintText: S.current
                                            .profilePageCityFieldHintText,
                                        lableText: S.current
                                            .profilePageCityFieldLabelText,
                                      ),
                                      const SizedBox(
                                        height: 18,
                                      ),
                                      PrimaryButton(
                                        onTap: () {
                                          context
                                              .read<ProfileBloc>()
                                              .add(ProfileLogoutEvent());
                                        },
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
                                        controller:
                                            _textFormParentsContactController,
                                        hintText: S.current
                                            .profilePageParentsContactFieldHintText,
                                        lableText: S.current
                                            .profilePageParentsContactFieldLabelText,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
