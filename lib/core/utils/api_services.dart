import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  final Dio _dio;
  final baseUrl = 'https://student.valuxapps.com/api/';

  ApiServices(this._dio);
  // get
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await _dio.get('$baseUrl$endPoint',
        options: Options(headers: {
          'lang': 'en',
          'Authorization': sharedPreferences.getString('token'),
        }));
    return response.data;
  }

  // post
  Future<Map<String, dynamic>> post(
      {required String endPoint, Map<String, dynamic>? body}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await _dio.post('$baseUrl$endPoint',
        data: body,
        options: Options(headers: {
          'lang': 'en',
          'Authorization': sharedPreferences.getString('token')
        }));
    return response.data;
  }

  // delete
  Future<Map<String, dynamic>> delete({required String endPoint}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await _dio.delete('$baseUrl$endPoint',
        options: Options(headers: {
          'lang': 'en',
          'Authorization': sharedPreferences.getString('token')
        }));
    return response.data;
  }

  Future<Map<String, dynamic>> put(
      {required String endPoint, required Map<String, dynamic> body}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await _dio.put('$baseUrl$endPoint',
        data: body,
        options: Options(headers: {
          'lang': 'en',
          'Authorization': sharedPreferences.getString('token')
        }));
    return response.data;
  }
}
