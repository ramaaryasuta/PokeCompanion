import 'dart:developer';

import 'package:dio/dio.dart';

const String baseUrl = 'https://pokeapi.co/api/v2';

// my free hosting
const String myHostingList = 'https://www.jsonkeeper.com/b/AVET';

class ApiServices {
  final Dio dio;

  String? activeUrl; // if use for other url

  ApiServices({this.activeUrl})
      : dio = Dio(BaseOptions(baseUrl: activeUrl ?? baseUrl));

  Future<Response<dynamic>> getRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    log('GET : $baseUrl$path');
    return await safeApiCall(
        () => dio.get(path, queryParameters: queryParameters));
  }

  Future<Response<dynamic>> postRequest({
    required String path,
    Map<String, dynamic>? data,
  }) async {
    return await safeApiCall(() => dio.post(path, data: data));
  }

  Future<Response<dynamic>> safeApiCall(
      Future<Response<dynamic>> Function() apiCall) async {
    try {
      final response = await apiCall();
      return response;
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
