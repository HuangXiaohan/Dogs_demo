import 'package:dogs_demo_bloc/services/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _loginService = GetIt.I<LoginService>();

  LoginBloc() : super(const LoginState()) {
    on<LoginPressedEvent>(_onLoginPressed);
  }

  Future<void> _onLoginPressed(LoginPressedEvent event, Emitter emitter) async {
    await _loginService.login(email: event.email, password: event.password).then((value) {
      if (value) {
        emitter(state.copyWith(isLogin: value));
      }
    });
  }
}
