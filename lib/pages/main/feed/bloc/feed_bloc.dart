import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:naslet/models/Event.dart';

import '../../../../services/APIService.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc() : super(FeedLoading()) {
    on<FeedEvent>((event, emit) async {
      if (event is FeedLoadEvent) {
        List<Event> events = await _loadEvents();
        emit(FeedLoaded(events: events));
      }
    });
  }

  Future<List<Event>> _loadEvents() async {
    var response = await APIService.getRequest(request: 'events');

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
