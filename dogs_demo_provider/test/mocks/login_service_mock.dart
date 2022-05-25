import 'package:dogs_demo_provider/features/login/models/login_info.dart';
import 'package:dogs_demo_provider/services/login_service.dart';
import 'package:mockito/mockito.dart';

class LoginServiceMock extends Mock implements LoginService {
  @override
  Future<LoginInfo> login({required String email, required String password}) {
    if (email == 'eve.holt@reqres.in' && password == 'cityslicka') {
      return Future.value(LoginInfo(token: 'QpwL5tke4Pnpja7X4'));
    } else {
      return Future.value(LoginInfo(errorMsg: 'user not found'));
    }
  }
}
