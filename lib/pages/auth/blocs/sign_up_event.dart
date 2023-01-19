part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpReg extends SignUpEvent {
  final String email;
  final String password;

  SignUpReg({
    required this.email,
    required this.password,
  });
}
