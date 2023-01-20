import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:naslet_mobile/ui/Buttons.dart';

import '../../../generated/l10n.dart';
import '../../../services/ColorService.dart';
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(S.current.profilePageTitleText),
                Spacer(),
                CircleButton(width: 40, height: 40, onTap: () {}, imgPath: A.assetsProfilePageDoneMarkIcon)
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
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 195,
                      height: 195,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF8187BD).withOpacity(0.15),
                            spreadRadius: 0,
                            blurRadius: 25,
                            offset: Offset(0, 8), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(1, 1),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: colorService.primaryColor(),
                      ),
                      child: Container(
                          width: 19,
                          height: 19,
                          child: Image.asset(A.assetsProfilePagePencileIcon)),
                    ),
                  )
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
            Column(
              children: [
                Text(S.current.profilePageBirthDateFieldLabelText),
                Row(
                  children: [
                    DropdownDateField()
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
            ProfilePageTextField(
              controller: _textFormCityController,
              lableText: S.current.profilePageCityFieldLabelText,
              hintText: S.current.profilePageCityFieldHintText,
            ),
            const SizedBox(
              height: 20,
            ),
            LogOutButton(
              onTap: () {},
              height: 41,
              title: S.current.logOutButtonText,
              color: colorService.logOutBottomColor(),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
