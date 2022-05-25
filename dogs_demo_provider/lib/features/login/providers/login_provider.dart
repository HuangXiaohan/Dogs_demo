import 'package:dogs_demo_provider/features/login/models/login_info.dart';
import 'package:dogs_demo_provider/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LoginProvider extends ChangeNotifier {
  LoginInfo _loginInfo = LoginInfo();

  LoginInfo get loginInfo => _loginInfo;

  final _loginService = GetIt.I<LoginService>();

  Future<void> login({required String email, required String password}) async {
    _loginService.login(email: email, password: password).then((value) {
      _loginInfo = value;

      notifyListeners();
    });
  }
}
