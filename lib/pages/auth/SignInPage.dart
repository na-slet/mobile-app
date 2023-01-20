import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../generated/l10n.dart';
import '../../services/AuthService.dart';
import '../../services/ColorService.dart';
import '../../ui/Buttons.dart';
import '../../ui/Fields.dart';
import '../../utils/Assets.dart';
import '../../utils/Routes.dart';
import '../../utils/ScreenSize.dart';
import 'blocs/sign_in_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final colorService = Injector().get<ColorService>();
  final authService = Injector().get<AuthService>();

  final _textFormLoginController = TextEditingController();
  final _textFormPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    authService.initializeFirebase(context: context);
    return BlocProvider(
      create: (context) => SignInBloc(authService: authService),
      child: Scaffold(
        body: BlocConsumer<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is SignInError) {
              _showSnackBar(context: context, text: state.error);
            } else if (state is SignInSuccess) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes.mainPage, (route) => false);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  color: colorService.desktopBackground(),
                  alignment: Alignment.topCenter,
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: FractionallySizedBox(
                          alignment: const Alignment(0, -0.8),
                          widthFactor: setSignInOptionWidth(context),
                          heightFactor: setSignInOptionHeight(context),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: (MediaQuery.of(context).size.width >
                                      WidthFormFactor.tablet)
                                  ? BorderRadius.circular(10)
                                  : null,
                            ),
                            child: FractionallySizedBox(
                              alignment: Alignment.center,
                              widthFactor: setWidthFactor(context),
                              heightFactor: setHeightFactor(context),
                              child: Form(
                                key: _formKey,
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
                                      S.current.signInScreenText,
                                      style: TextStyle(
                                        color: colorService
                                            .signInScreenTitleColor(),
                                        fontSize: 32,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    PrimaryTextField(
                                      autofocus: true,
                                      readonly: (state is SignInLoading),
                                      labelText: S.current.loginFieldHintText,
                                      labelStyle: TextStyle(
                                          color: colorService.secondaryGrey()),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return S.current.emailError;
                                        }
                                        return null;
                                      },
                                      controller: _textFormLoginController,
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    PrimaryTextField(
                                      readonly: (state is SignInLoading),
                                      labelText:
                                          S.current.passwordFieldHintText,
                                      labelStyle: TextStyle(
                                          color: colorService.secondaryGrey()),
                                      obscureText: true,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return S.current.passwordError;
                                        }
                                        return null;
                                      },
                                      controller: _textFormPasswordController,
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    SizedBox(
                                      child: PrimaryButton(
                                        enabled: (state is SignInLoading)
                                            ? false
                                            : true,
                                        onTap: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            context.read<SignInBloc>().add(
                                                SignInAuth(
                                                    email:
                                                        _textFormLoginController
                                                            .text,
                                                    password:
                                                        _textFormPasswordController
                                                            .text));
                                          }
                                        },
                                        title: S.current.signInButtonText,
                                        gradient:
                                            colorService.primaryGradient(),
                                        textStyle: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        (!kIsWeb && Platform.isAndroid)
                                            ? CircleButton(
                                                onTap: () {
                                                  context
                                                      .read<SignInBloc>()
                                                      .add(SignInAuthVK());
                                                },
                                                imgPath: A.assetsAuthVkImg,
                                              )
                                            : Container(),
                                        SizedBox(
                                          width: (!kIsWeb && Platform.isAndroid)
                                              ? 25
                                              : 0,
                                        ),
                                        CircleButton(
                                          onTap: () {
                                            context
                                                .read<SignInBloc>()
                                                .add(SignInAuthGoogle());
                                          },
                                          imgPath: A.assetsAuthGoogleImg,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          S.current.signInRegQuestionText,
                                          style: TextStyle(
                                            color: colorService.secondaryGrey(),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        PrimaryTextButton(
                                          onTap: () {
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                Routes.signUpPage,
                                                (route) => false);
                                          },
                                          text: S.current.signInRegButtonText,
                                          textStyle: TextStyle(
                                            fontSize: 12,
                                            color: colorService.primaryColor(),
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor:
                                                colorService.primaryColor(),
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
                    ],
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
