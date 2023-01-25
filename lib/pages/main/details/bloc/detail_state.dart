part of 'detail_bloc.dart';

@immutable
abstract class DetailState {}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailError extends DetailState {
  final String message;

  DetailError({required this.message});
}

class DetailSuccess extends DetailState {
  final String message;

  DetailSuccess({required this.message});
}
