part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final String token;

  SignUpSuccess({required this.token});
}

class SignUpError extends SignUpState {
  final String error;

  SignUpError({required this.error});
}
