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

  static Future<dynamic> getRequest(
      {required String request, Map<String, String> data = const {}}) async {
    try {
      var response = await Dio().get('$_url/$request', queryParameters: data);
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      }
    } catch (e) {
      return '';
    }
    return '';
  }

  static Future<dynamic> putRequest(
      {required String request, Map<String, String> data = const {}}) async {
    try {
      var response = await Dio().put('$_url/$request', queryParameters: data);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      return '';
    }
    return '';
  }
}
