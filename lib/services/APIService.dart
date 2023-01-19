import 'package:dio/dio.dart';

class APIService {
  static const _url = 'http://thevladoss.site:8000';

  Future<String> authUser(
      {required String email, required String password}) async {
    dynamic data = await _postRequest(
        request: 'user/login', data: {'identity': email, 'password': password});

    if (data != '') return data['access_token'];
    return '';
  }

  Future<String> regUser(
      {required String email, required String password}) async {
    dynamic data = await _postRequest(
        request: 'user/register', data: {'email': email, 'password': password});

    if (data != '') return data['details'];
    return '';
  }

  Future<dynamic> _postRequest(
      {required String request, Map<String, String> data = const {}}) async {
    try {
      var response = await Dio().post('$_url/$request', queryParameters: data);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      return '';
    }
    return '';
  }
}
