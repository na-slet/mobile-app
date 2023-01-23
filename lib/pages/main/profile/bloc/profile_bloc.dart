import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:naslet_mobile/services/APIService.dart';

import '../../../../models/User.dart';
import '../../../../services/AuthService.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthService authService;

  ProfileBloc({
    required this.authService,
  }) : super(ProfileLoading()) {
    on<ProfileEvent>((event, emit) async {
      if (event is ProfileLogoutEvent) {
        await authService.signOut();
        emit(ProfileLogoutState());
      } else if (event is ProfileLoadUser) {
        emit(ProfileLoaded(user: await _loadUser()));
      }
    });
  }

  Future<User> _loadUser() async {
    var response = await APIService.getRequest(
        request: 'user', queryParameters: {'access_token': authService.token});

    print(response);

    return User.fromMap(response);
  }
}
