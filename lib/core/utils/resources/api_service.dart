import 'package:dio/dio.dart';
import 'package:figner_print_auth/core/utils/resources/constant_api.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<dynamic> get({required String endPoint}) async {
    _dio.interceptors.add(LogInterceptor(responseBody: true));

    String baseUrl = '$endPoint';
    var response = await _dio.get(baseUrl);
    print(baseUrl);
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      String endPoint, Map<String, dynamic> body) async {
    _dio.interceptors.add(LogInterceptor(responseBody: true));

    var response =
        await _dio.post('${ConstantApi.baseUrl}$endPoint', data: body);
    print(response.data);
    print(body);
    return response.data;
  }
}
