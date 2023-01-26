part of 'feed_bloc.dart';

@immutable
abstract class FeedEvent {}

class FeedLoadEvent extends FeedEvent {
  final List<Event> events;

  FeedLoadEvent({required this.events});
}
