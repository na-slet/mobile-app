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

class SignUpRegVK extends SignUpEvent {}

class SignUpRegGoogle extends SignUpEvent {
  final BuildContext context;

  SignUpRegGoogle({
    required this.context,
  });
}
