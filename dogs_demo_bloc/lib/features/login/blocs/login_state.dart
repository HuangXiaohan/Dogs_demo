part of 'login_bloc.dart';

class LoginState {
  final bool isLogin;
  final String? errorMsg;

  const LoginState({this.isLogin = false, this.errorMsg});

  LoginState copyWith({bool? isLogin, String? errorMsg}) {
    return LoginState(isLogin: isLogin ?? this.isLogin, errorMsg: errorMsg ?? this.errorMsg);
  }
}
