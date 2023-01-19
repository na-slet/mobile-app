import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../services/APIService.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final APIService apiService;

  SignUpBloc({
    required this.apiService,
  }) : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) {
      if (event is SignUpReg) {
        emit(SignUpLoading());
        _regUser(email: event.email, password: event.password, emitter: emit);
      }
    });
  }

  Future<String> _regUser(
      {required String email,
      required String password,
      required Emitter<SignUpState> emitter}) async {
    apiService.regUser(email: email, password: password).then((value) => {
          if (value != '')
            emit(SignUpSuccess(token: value))
          else
            emit(SignUpError(error: 'Ошибка! Попробуйте еще раз'))
        });
    return '';
  }
}
