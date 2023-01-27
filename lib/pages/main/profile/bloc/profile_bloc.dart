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
    _loadUser().then((value) => add(ProfileLoadUser(user: value)));
    on<ProfileEvent>((event, emit) async {
      if (event is ProfileLogoutEvent) {
        await authService.signOut();
        emit(ProfileLogoutState());
      } else if (event is ProfileLoadUser) {
        emit(ProfileLoaded(user: event.user));
      } else if (event is ProfileUpdateUser) {
        emit(ProfileLoading());
        Map<String, String> data = {};
        if (event.firstName != '') {
          data.addAll({'first_name': event.firstName});
        }
        if (event.lastName != '') {
          data.addAll({'last_name': event.lastName});
        }
        if (event.middleName != '') {
          data.addAll({'middle_name': event.middleName});
        }
        if (event.phone != '') {
          data.addAll({'phone': event.phone});
        }
        if (event.parentPhone != '') {
          data.addAll({'parent_phone': event.parentPhone});
        }
        if (event.parentFIO != '') {
          data.addAll({'parent_fio': event.parentFIO});
        }
        if (event.email != '') {
          data.addAll({'email': event.email});
        }
        if (event.city != '') {
          data.addAll({'city': event.city});
        }
        data.addAll({'birth_date': event.birthDate});
        data.addAll({'union_id': event.union});
        await _updateUser(data: data);
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
