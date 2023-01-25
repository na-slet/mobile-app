import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../models/User.dart';
import '../../../../services/APIService.dart';
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
        emit(ProfileLoading());
        await _updateUser(data: {
          'first_name': event.firstName,
          'last_name': event.lastName,
          'middle_name': event.middleName,
          'phone': event.phone,
          'parent_phone': event.parentPhone,
          'parent_fio': event.parentFIO,
          'email': event.email,
          'city': event.city,
          'birth_date': event.birthDate,
          'union_id': event.union,
        });
        emit(ProfileLoaded(user: await _loadUser()));
      }
    });
  }

  Future<User> _loadUser() async {
    var response = await APIService.getRequest(
        request: 'user', queryParameters: {'access_token': authService.token});

    return User.fromMap(response);
  }

  _updateUser({Map<String, String> data = const {}}) async {
    print(data);
    await APIService.putRequest(
        request: 'user',
        queryParameters: {'access_token': authService.token},
        data: data);
  }
}
