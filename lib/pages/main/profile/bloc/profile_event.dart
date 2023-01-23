part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class ProfileLoadUser extends ProfileEvent {}

class ProfileLogoutEvent extends ProfileEvent {}
