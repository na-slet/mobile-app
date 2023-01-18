import 'package:dio/dio.dart';

class APIService {
  static const _url = 'http://thevladoss.site:8000';

  Future<String> authUser(
      {required String email, required String password}) async {
    return await _postRequest(
        request: 'user/login', data: {'identity': email, 'password': password});
  }

  Future<String> _postRequest(
      {required String request, Map<String, String> data = const {}}) async {
    try {
      var response = await Dio().post('$_url/$request', queryParameters: data);
      if (response.statusCode == 200) {
        return response.data['access_token'];
      }
    } catch (e) {
      return '';
    }
    return '';
  }
}
