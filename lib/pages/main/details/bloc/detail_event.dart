part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

class DetailParticipateEvent extends DetailEvent {}

class DetailPaymentEvent extends DetailEvent {}
