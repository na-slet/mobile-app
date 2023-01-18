// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signin_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInAuth extends SignInEvent {
  final String email;
  final String password;

  SignInAuth({
    required this.email,
    required this.password,
  });
}
