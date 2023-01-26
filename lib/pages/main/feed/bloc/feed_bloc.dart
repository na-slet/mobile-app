import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:naslet/models/Event.dart';

import '../../../../services/APIService.dart';
import '../../../../services/AuthService.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final AuthService authService;

  FeedBloc({
    required this.authService,
  }) : super(FeedLoading()) {
    _loadEvents().then((value) => add(FeedLoadEvent(events: value)));
    on<FeedEvent>((event, emit) async {
      if (event is FeedLoadEvent) {
        emit(FeedLoaded(events: event.events));
      }
    });
  }

  Future<List<Event>> _loadEvents() async {
    var response = await APIService.getRequest(
        request: 'events',
        queryParameters: {'access_token': authService.token});

    if (response != '') {
      try {
        List<Event> events = List<Event>.generate(
            response.length, (i) => Event.fromMap(response[i]));

        return events;
      } catch (e) {
        print(e);
        return [];
      }
    }

    return [];
  }
}
