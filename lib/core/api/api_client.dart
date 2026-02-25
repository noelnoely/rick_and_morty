import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: "https://rickandmortyapi.com/api",
        ),
      );

  Future<Map<String, dynamic>> getCharacters({
    required int page,
    required String query,
  }) async {
    final Map<String, dynamic> queryParameters = {
      "page": page,
    };

    if (query.isNotEmpty) {
      queryParameters["name"] = query;
    }

    final response = await _dio.get(
      "/character",
      queryParameters: queryParameters,
    );

    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getCharacterById(int id) async {
    final response = await _dio.get("/character/$id");

    return response.data as Map<String, dynamic>;
  }
}
