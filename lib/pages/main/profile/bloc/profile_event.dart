// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class ProfileLoadUser extends ProfileEvent {
  final User user;

  ProfileLoadUser({required this.user});
}

class ProfileUpdateUser extends ProfileEvent {
  final String firstName;
  final String lastName;
  final String middleName;
  final String phone;
  final String parentPhone;
  final String parentFIO;
  final String email;
  final String city;
  final String birthDate;
  final String union;

  ProfileUpdateUser({
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.phone,
    required this.parentPhone,
    required this.parentFIO,
    required this.email,
    required this.city,
    required this.birthDate,
    required this.union,
  });
}

class ProfileLogoutEvent extends ProfileEvent {}
