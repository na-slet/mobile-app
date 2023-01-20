import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../generated/l10n.dart';
import '../../../services/AuthService.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthService authService;

  SignUpBloc({
    required this.authService,
  }) : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      String response = S.current.tryAgainError;

      if (event is SignUpReg) {
        emit(SignUpLoading());
        response = await authService.regUser(
            email: event.email, password: event.password);
      } else if (event is SignUpRegVK) {
        emit(SignUpLoading());
        response = await authService.authVK();
      } else if (event is SignUpRegGoogle) {
        emit(SignUpLoading());
        response = await authService.authGoogle();
      }

      if (response.contains('Token: ')) {
        emit(SignUpSuccess(token: response));
      } else {
        emit(SignUpError(error: response));
      }
    });
  }
}
