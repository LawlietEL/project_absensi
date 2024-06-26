import 'package:dio/dio.dart';

class ApiClient {
  final baseUrl = 'http://localhost:8000/api';

  Dio dio = Dio();

  Future<Response> login(String email, String password) async {
    try {
      var response = await dio.post(
        '$baseUrl/login',
        data: {'email': email, 'password': password},
        options: Options(headers: {
          'Accept': 'application/json',
        }),
      );
      print(response);
      // });
      return response;
    } on DioException catch (e) {
      print(e);
      return e.response!;
    }
  }

  Future<Response> logout({required String accesstoken}) async {
    try {
      var response = await dio.post(
        '$baseUrl/logout',
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer $accesstoken',
          },
        ),
      );
      // });
      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }
}
