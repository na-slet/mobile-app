part of 'events_bloc.dart';

@immutable
abstract class EventsEvent {}

class EventsLoadEvent extends EventsEvent {
  final List<Event> events;

  EventsLoadEvent({required this.events});
}
