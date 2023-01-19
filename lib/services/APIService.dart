import 'package:dio/dio.dart';

class APIService {
  static const _url = 'http://thevladoss.site:8000';

  static Future<dynamic> postRequest(
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
