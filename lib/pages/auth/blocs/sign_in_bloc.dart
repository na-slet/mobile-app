// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:naslet_mobile/services/APIService.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final APIService apiService;

  SignInBloc({
    required this.apiService,
  }) : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {
      if (event is SignInAuth) {
        emit(SignInLoading());
        _authUser(email: event.email, password: event.password, emitter: emit);
      }
    });
  }

  Future<String> _authUser(
      {required String email,
      required String password,
      required Emitter<SignInState> emitter}) async {
    apiService.authUser(email: email, password: password).then((value) => {
          if (value != '')
            emit(SignInSuccess(token: value))
          else
            emit(SignInError(error: 'Ошибка! Попробуйте еще раз'))
        });
    return '';
  }
}
