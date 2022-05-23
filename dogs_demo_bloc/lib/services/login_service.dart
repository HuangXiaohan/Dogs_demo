import 'package:dio/dio.dart';

class LoginService {
  var dio = Dio();

  Future<bool> login({required String email, required String password}) {
    const uri = 'https://reqres.in/api/register';
    final data = {'email': email, 'password': password};
    try {
      return dio.post(uri, data: data).then((response) {
        if (response.statusCode == 200) {
          return true;
        } else {
          return false;
        }
      });
    } on DioError catch (e) {
      throw ('Error occurred: $e');
    }
  }
}
