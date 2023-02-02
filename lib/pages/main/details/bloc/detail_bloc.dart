// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:naslet/models/EventState.dart';
import 'package:naslet/services/AuthService.dart';

import '../../../../generated/l10n.dart';
import '../../../../services/APIService.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final AuthService authService;
  final String eventId;
  EventState eventState;

  DetailBloc({
    required this.authService,
    required this.eventId,
    required this.eventState,
  }) : super(DetailInitial()) {
    on<DetailEvent>((event, emit) async {
      if (event is DetailParticipateEvent) {
        emit(DetailLoading());
        String answer = await _participateEvent();
        if (answer != '') {
          eventState = EventState.paymentNeeded;
          emit(DetailSuccess(message: answer));
        } else {
          emit(DetailError(message: S.current.maybeWithoutProfileError));
        }
      } else if (event is DetailPaymentEvent) {
        emit(DetailLoading());
        String answer = await _paymentEvent();
        if (answer != '') {
          eventState = EventState.awaiting;
          emit(DetailSuccess(message: answer));
        } else {
          emit(DetailError(message: S.current.maybeWithoutProfileError));
        }
      }
    });
  }

  Future<String> _participateEvent() async {
    var response = await APIService.postRequest(
        request: 'event',
        queryParameters: {'access_token': authService.token},
        data: {'id': eventId});

    if (response != '') {
      return S.current.detailButtonStatePaymentNeeded;
    } else {
      return '';
    }
  }

  Future<String> _paymentEvent() async {
    var response = await APIService.postRequest(
        request: 'user/event/payment',
        queryParameters: {
          'access_token': authService.token,
          'event_id': eventId
        });
    if (response != '') {
      return S.current.detailButtonStateBooked;
    } else {
      return '';
    }
  }
}
