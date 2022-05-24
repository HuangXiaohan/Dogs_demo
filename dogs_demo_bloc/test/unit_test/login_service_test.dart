import 'package:dogs_demo_bloc/features/login/models/login_info.dart';
import 'package:dogs_demo_bloc/services/login_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Login service test', () {
    late LoginService loginService;

    setUp(() {
      loginService = LoginService();
    });

    test('Login success test', () async {
      LoginInfo loginInfo = await loginService.login(email: 'eve.holt@reqres.in', password: 'cityslicka');
      expect(loginInfo.token, isNotNull);
      expect(loginInfo.errorMsg, null);
    });

    test('Login failed test', () async {
      LoginInfo loginInfo = await loginService.login(email: 'peter@klaven', password: 'qsdfezrf');
      expect(loginInfo.token, null);
      expect(loginInfo.errorMsg, 'user not found');
    });
  });
}
