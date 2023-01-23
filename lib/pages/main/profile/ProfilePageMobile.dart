import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:naslet_mobile/ui/Buttons.dart';

import '../../../generated/l10n.dart';
import '../../../services/ColorService.dart';
import '../../../services/GradientService.dart';
import '../../../ui/Fields.dart';
import '../../../utils/Assets.dart';
import '../../../utils/Routes.dart';
import 'bloc/profile_bloc.dart';

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
    double dateFieldWidth = (deviceWidth - 16) * 0.25 - 3;
    double monthFieldWidth = (deviceWidth - 16) * 0.5 - 3;
    double yearFieldWidth = (deviceWidth - 16) * 0.25 - 3;

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
          _textFormCityController.text = state.user.city ?? '';
          _textFormContactController.text = state.user.phone ?? '';
          _textFormParentsContactController.text = state.user.parentPhone ?? '';
          _textFormEmailController.text = state.user.email;
        }

        return (state is ProfileLoading)
            ? const Center(child: CupertinoActivityIndicator())
            : SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 30),
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
                                  context.read<ProfileBloc>().add(
                                      ProfileUpdateUser(
                                          firstName: _textFormNameController
                                              .value.text,
                                          lastName: _textFormSurnameController
                                              .value.text,
                                          phone: _textFormContactController
                                              .value.text,
                                          parentPhone:
                                              _textFormParentsContactController
                                                  .value.text,
                                          email: _textFormEmailController
                                              .value.text,
                                          city: _textFormCityController
                                              .value.text));
                                },
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
                          lableText: S.current.profilePageNameFieldLabelText,
                          hintText: S.current.profilePageNameFieldHintText,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ProfilePageTextField(
                          controller: _textFormPatronymicController,
                          lableText:
                              S.current.profilePagePatronymicFieldLabelText,
                          hintText:
                              S.current.profilePagePatronymicFieldHintText,
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
                                  items: monthList,
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
                                  items: yearList,
                                  hintPadding: const EdgeInsets.only(left: 12),
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
                          controller: _textFormInitialsController,
                          lableText:
                              S.current.profilePageInitialsFieldLabelText,
                          hintText: S.current.profilePageInitialsFieldHintText,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ProfilePageTextField(
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
                              color:
                                  colorService.profilePageTexFieldHintColor(),
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
                          items: unification,
                          textColor:
                              colorService.profilePageTexFieldHintColor(),
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
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
