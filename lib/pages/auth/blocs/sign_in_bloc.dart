// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_login_vk/flutter_login_vk.dart';
import 'package:meta/meta.dart';

import 'package:naslet_mobile/services/APIService.dart';

import '../../../generated/l10n.dart';

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
        _authUser(email: event.email, password: event.password, emit: emit);
      } else if (event is SignInAuthVK) {
        emit(SignInLoading());
        await _authVKUser(emit: emit);
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
                .authUser(email: email, password: profile.userId.toString())
                .then((value) => {
                      if (value != '')
                        emit(SignInSuccess(token: value))
                      else
                        SignInError(error: S.current.userNotExistError)
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

  _authUser(
      {required String email,
      required String password,
      required Emitter<SignInState> emit}) async {
    apiService
        .authUser(email: email, password: password)
        .then((value) => {if (value != '') emit(SignInSuccess(token: value))});
    emit(SignInError(error: S.current.userNotExistError));
  }
}
