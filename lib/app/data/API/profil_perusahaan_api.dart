import 'package:dio/dio.dart';
import 'package:project_absensi/app/data/api_client.dart';

class ProfilPerusahaanApi extends ApiClient {
  Future<Response> getProfilPerusahaan({required String accesstoken}) async {
    try {
      String v = '1';
      var response = await dio.get(
        '$baseUrl/profil_perusahaan/$v',
        options: Options(
          headers: {
            'Authorization': 'Benar $accesstoken',
          },
        ),
      );
      print('request perusahaan');
// Don't invoke 'print' in production code. Try using a logging framework.
      print(response.data);
      print('end request perusahaan');
      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }
}
