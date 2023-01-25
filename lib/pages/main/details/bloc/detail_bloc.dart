// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:naslet/services/AuthService.dart';

import '../../../../generated/l10n.dart';
import '../../../../services/APIService.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final AuthService authService;
  final String eventId;

  DetailBloc({
    required this.authService,
    required this.eventId,
  }) : super(DetailInitial()) {
    on<DetailEvent>((event, emit) async {
      if (event is DetailParticipateEvent) {
        emit(DetailLoading());
        String answer = await _participateEvent();
        if (answer != '') {
          emit(DetailSuccess(message: answer));
        }
        emit(DetailError(message: S.current.tryAgainError));
      }
    });
  }

  Future<String> _participateEvent() async {
    var response = await APIService.postRequest(
        request: 'event',
        queryParameters: {'access_token': authService.token},
        data: {'id': eventId});

    if (response != '') {
      return S.current.detailButtonStateBooked;
    } else {
      return '';
    }
  }
}
