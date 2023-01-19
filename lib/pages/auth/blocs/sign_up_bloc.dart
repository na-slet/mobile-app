import 'package:bloc/bloc.dart';
import 'package:flutter_login_vk/flutter_login_vk.dart';
import 'package:meta/meta.dart';

import '../../../generated/l10n.dart';
import '../../../services/APIService.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final APIService apiService;

  SignUpBloc({
    required this.apiService,
  }) : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is SignUpReg) {
        emit(SignUpLoading());
        _regUser(email: event.email, password: event.password, emit: emit);
      } else if (event is SignUpRegVK) {
        emit(SignUpLoading());
        await _regVKUser(emit: emit);
      }
    });
  }

  _regVKUser({required Emitter<SignUpState> emit}) async {
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
                        emit(SignUpSuccess(token: value))
                      else
                        emit(SignUpError(error: S.current.tryAgainError))
                    });
          } else {
            emit(SignUpError(error: S.current.needEmailError));
          }
        } else {
          emit(SignUpError(error: S.current.unexpectedError));
        }
      } else {
        emit(SignUpError(error: S.current.needAccessError));
      }
    } else {
      emit(SignUpError(error: S.current.unexpectedError));
    }
  }

  _regUser(
      {required String email,
      required String password,
      required Emitter<SignUpState> emit}) async {
    apiService
        .regUser(email: email, password: password)
        .then((value) => {if (value != '') emit(SignUpSuccess(token: value))});
    emit(SignUpError(error: S.current.tryAgainError));
  }
}
