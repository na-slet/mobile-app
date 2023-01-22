import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../services/AuthService.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthService authService;
  ProfileBloc({
    required this.authService,
  }) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is ProfileLogoutEvent) {
        await authService.signOut();
        emit(ProfileLogoutState());
      }
    });
  }
}
