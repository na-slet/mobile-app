import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:naslet_mobile/services/APIService.dart';

import '../../common_setup/Assets.dart';
import '../../common_setup/Routes.dart';
import '../../common_setup/ScreenSize.dart';
import '../../generated/l10n.dart';
import '../../services/ColorService.dart';
import '../../services/GradientService.dart';
import '../../ui/Buttons.dart';
import '../../ui/Fields.dart';
import 'blocs/sign_up_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final colorService = Injector().get<ColorService>();
  final apiService = Injector().get<APIService>();

  final _textFormLoginController = TextEditingController();
  final _textFormPasswordController = TextEditingController();
  final _textFormPasswordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(apiService: apiService),
      child: Scaffold(
        body: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpError) {
              _showSnackBar(context: context, text: state.error);
            } else if (state is SignUpSuccess) {
              _showSnackBar(context: context, text: state.token);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  color: colorService.desktopBackground(),
                  alignment: Alignment.topCenter,
                  child: FractionallySizedBox(
                    alignment: const Alignment(0, -0.8),
                    widthFactor: setSignUpOptionWidth(context),
                    heightFactor: setSignUpOptionHeight(context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.center,
                        widthFactor: setWidthFactor(context),
                        heightFactor: setHeightFactor(context),
                        child: SingleChildScrollView(
                          child: Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 134,
                                  height: 59,
                                  child: Image.asset(A.assetsAppLogo),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  S.current.signUpScreenText,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color:
                                        colorService.signInScreenTitleColor(),
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                PrimaryTextField(
                                  autofocus: true,
                                  readonly: (state is SignUpLoading),
                                  labelText: S.current.loginFieldHintText,
                                  labelStyle: TextStyle(
                                      color: colorService.secondaryGrey()),
                                  controller: _textFormLoginController,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                PrimaryTextField(
                                  readonly: (state is SignUpLoading),
                                  labelText: S.current.passwordFieldHintText,
                                  labelStyle: TextStyle(
                                      color: colorService.secondaryGrey()),
                                  obscureText: true,
                                  controller: _textFormPasswordController,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                PrimaryTextField(
                                  readonly: (state is SignUpLoading),
                                  labelText:
                                      S.current.passwordConfirmFieldHintText,
                                  labelStyle: TextStyle(
                                      color: colorService.secondaryGrey()),
                                  obscureText: true,
                                  controller:
                                      _textFormPasswordConfirmController,
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                SizedBox(
                                  child: GradinetLeftToRight(
                                    tileMode: TileMode.clamp,
                                    child: PrimaryButton(
                                      onTap: (state is SignUpLoading)
                                          ? null
                                          : () {
                                              context.read<SignUpBloc>().add(
                                                  SignUpReg(
                                                      email:
                                                          _textFormLoginController
                                                              .text,
                                                      password:
                                                          _textFormPasswordController
                                                              .text));
                                            },
                                      title: S.current.signUpButtonText,
                                      color: Colors.transparent,
                                      textStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        height: 1,
                                        color: colorService
                                            .signInDecorationLineColor(),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      S.current.altAuthText,
                                      style: TextStyle(
                                        color: colorService.secondaryGrey(),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 1,
                                        color: colorService
                                            .signInDecorationLineColor(),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleButton(
                                      onTap: () {},
                                      imgPath: A.assetsAuthVkImg,
                                    ),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    CircleButton(
                                      onTap: () {},
                                      imgPath: A.assetsAuthGoogleImg,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      S.current.signUpEntryQuestionText,
                                      style: TextStyle(
                                        color: colorService.secondaryGrey(),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    GradinetLeftToRight(
                                      tileMode: TileMode.clamp,
                                      blendMode: BlendMode.srcIn,
                                      child: PrimaryTextButton(
                                        onTap: () {
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              Routes.signInPage,
                                              (Route<dynamic> route) => false);
                                        },
                                        text: S.current.signUpEntryButtonText,
                                        textStyle: TextStyle(
                                          fontSize: 12,
                                          color: colorService.primaryColor(),
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              colorService.primaryColor(),
                                        ),
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
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _showSnackBar({required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
    ));
  }
}
