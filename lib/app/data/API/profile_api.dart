import 'package:dio/dio.dart';
import 'package:project_absensi/app/data/api_client.dart';

class ProfileApi extends ApiClient {
  Future<Response> getProfile({required String accesstoken}) async {
    try {
      var response = await dio.get(
        '$baseUrl/user',
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer $accesstoken',
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }
}
