// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_vk/flutter_login_vk.dart';
import 'package:meta/meta.dart';
import 'package:naslet_mobile/pages/auth/blocs/sign_up_bloc.dart';

import 'package:naslet_mobile/services/APIService.dart';

import '../../../generated/l10n.dart';
import '../../../utils/Authentication.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final APIService apiService;

  SignInBloc({
    required this.apiService,
  }) : super(SignInInitial()) {
    on<SignInEvent>((event, emit) async {
      if (event is SignInAuth) {
        emit(SignInLoading());
        await _authUser(
            email: event.email, password: event.password, emit: emit);
      } else if (event is SignInAuthVK) {
        emit(SignInLoading());
        await _authVKUser(emit: emit);
      } else if (event is SignInAuthGoogle) {
        emit(SignInLoading());
        await _authGoogleUser(context: event.context, emit: emit);
      }
    });
  }

  _authVKUser({required Emitter<SignInState> emit}) async {
    final vk = VKLogin();
    await vk.initSdk();

    final res = await vk.logIn(scope: [
      VKScope.email,
    ]);

    if (res.isValue) {
      final VKLoginResult result = res.asValue!.value;

      if (!result.isCanceled) {
        final VKAccessToken? accessToken = result.accessToken;
        if (accessToken != null) {
          final profileRes = await vk.getUserProfile();
          final profile = profileRes.asValue?.value;
          final String? email = await vk.getUserEmail();
          if (profile != null && email != null) {
            await apiService
                .regUser(email: email, password: profile.userId.toString())
                .then((value) => {
                      if (value != '')
                        emit(SignInSuccess(token: value))
                      else
                        SignInError(error: S.current.tryAgainError)
                    });
          } else {
            emit(SignInError(error: S.current.needEmailError));
          }
        } else {
          emit(SignInError(error: S.current.unexpectedError));
        }
      } else {
        emit(SignInError(error: S.current.needAccessError));
      }
    } else {
      emit(SignInError(error: S.current.unexpectedError));
    }
  }

  _authGoogleUser(
      {required BuildContext context,
      required Emitter<SignInState> emit}) async {
    User? user = await Authentication.signInWithGoogle(context: context);

    if (user != null && user.email != null) {
      await apiService
          .regUser(email: user.email!, password: user.uid)
          .then((value) => {
                if (value != '')
                  emit(SignInSuccess(token: value))
                else
                  emit(SignInError(error: S.current.tryAgainError))
              });
    } else {
      emit(SignInError(error: S.current.unexpectedError));
    }
  }

  _authUser(
      {required String email,
      required String password,
      required Emitter<SignInState> emit}) async {
    await apiService
        .authUser(email: email, password: password)
        .then((value) => {
              if (value != '')
                emit(SignInSuccess(token: value))
              else
                emit(SignInError(error: S.current.userNotExistError))
            });
  }
}
