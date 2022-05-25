import 'package:dio/dio.dart';
import 'package:dogs_demo_provider/features/login/models/login_info.dart';

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
        var errorMsg = '';
        if ((error.response?.data ?? '') != '') {
          errorMsg = error.response?.data['error'];
        }
        return LoginInfo(errorMsg: errorMsg);
      });
    } on DioError catch (e) {
      throw ('Error occurred: $e');
    }
  }
}
