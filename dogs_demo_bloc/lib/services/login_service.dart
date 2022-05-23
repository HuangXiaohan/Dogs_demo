import 'package:dio/dio.dart';

import '../features/login/models/login_info.dart';

class LoginService {
  var dio = Dio();

  Future<LoginInfo> login({required String email, required String password}) {
    const uri = 'https://reqres.in/api/login';
    final data = {'email': email, 'password': password};
    try {
      return dio.post(uri, data: data).then((response) {
        if (response.statusCode == 200) {
          return LoginInfo(token: response.data['token']);
        } else {
          return LoginInfo();
        }
      }).onError((DioError error, stackTrace) {
        return LoginInfo(errorMsg: error.response?.data['error'] ?? '');
      });
    } on DioError catch (e) {
      throw ('Error occurred: $e');
    }
  }
}
