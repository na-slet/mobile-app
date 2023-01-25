part of 'feed_bloc.dart';

@immutable
abstract class FeedState {}

class FeedLoading extends FeedState {}

class FeedLoaded extends FeedState {
  final List<Event> events;

  FeedLoaded({required this.events});
}
