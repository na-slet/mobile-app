// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:naslet_mobile/pages/auth/blocs/sign_up_bloc.dart';

import '../../../generated/l10n.dart';
import '../../../services/AuthService.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthService authService;

  SignInBloc({
    required this.authService,
  }) : super(SignInInitial()) {
    on<SignInEvent>((event, emit) async {
      String response = S.current.tryAgainError;

      if (event is SignInAuth) {
        emit(SignInLoading());
        response = await authService.loginUser(
            email: event.email, password: event.password);
      } else if (event is SignInAuthVK) {
        emit(SignInLoading());
        response = await authService.authVK();
      } else if (event is SignInAuthGoogle) {
        emit(SignInLoading());
        response = await authService.authGoogle();
      }

      if (response.contains('Token: ')) {
        emit(SignInSuccess(token: response));
      } else {
        emit(SignInError(error: response));
      }
    });
  }
}
