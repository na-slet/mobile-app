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
      } else if (event is ProfileUpdateUser) {
        _updateUser(data: {
          'first_name': event.firstName,
          'last_name': event.lastName,
          'middle_name': event.middleName,
          'phone': event.phone,
          'parent_phone': event.parentPhone,
          'parent_fio': event.parentFIO,
          'email': event.email,
          'city': event.city,
        });
      }
    });
  }

  Future<User> _loadUser() async {
    var response = await APIService.getRequest(
        request: 'user', queryParameters: {'access_token': authService.token});

    print(response);

    return User.fromMap(response);
  }

  _updateUser({Map<String, String> data = const {}}) async {
    var response = await APIService.putRequest(
        request: 'user',
        queryParameters: {'access_token': authService.token},
        data: data);

    print(response);
  }
}
