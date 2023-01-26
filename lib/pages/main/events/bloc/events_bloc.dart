// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:naslet/services/AuthService.dart';

import '../../../../models/Event.dart';
import '../../../../services/APIService.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final AuthService authService;

  EventsBloc({
    required this.authService,
  }) : super(EventsLoading()) {
    _loadEvents().then((value) => add(EventsLoadEvent(events: value)));
    on<EventsEvent>((event, emit) async {
      if (event is EventsLoadEvent) {
        emit(EventsLoaded(events: event.events));
      }
    });
  }

  Future<List<Event>> _loadEvents() async {
    var response = await APIService.getRequest(
        request: 'user/events',
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
