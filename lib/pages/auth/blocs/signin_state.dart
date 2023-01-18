part of 'signin_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final String token;

  SignInSuccess({required this.token});
}

class SignInError extends SignInState {
  final String error;

  SignInError({required this.error});
}
