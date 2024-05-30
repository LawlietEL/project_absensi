import 'package:dio/dio.dart';
import 'package:project_absensi/app/data/api_client.dart';

class ProfilPerusahaanApi extends ApiClient {
  Future<Response> getProfilPerusahaan({required String accesstoken}) async {
    try {
      var response = await dio.get(
        '$baseUrl/pegawai/profilperusahaan/1',
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Benar $accesstoken',
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }
}
