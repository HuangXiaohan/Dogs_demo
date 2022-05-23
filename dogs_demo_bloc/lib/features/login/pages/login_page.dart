import 'package:dogs_demo_bloc/features/login/blocs/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailTextController = TextEditingController();
  final pwdTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: BlocBuilder<LoginBloc, LoginState>(builder: (localContext, state) {
          return state.isLogin ? _welcomeWidget() : _loginWidget(localContext);
        }),
      ),
    );
  }

  Widget _loginWidget(BuildContext localContext) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // "email": "eve.holt@reqres.in",
                // "password": "cityslicka"
                TextFormField(
                  controller: emailTextController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return 'Please enter the email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: pwdTextController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return 'Please enter the password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                if (localContext.read<LoginBloc>().state.errorMsg != null) ...{
                  Text(
                    localContext.read<LoginBloc>().state.errorMsg!,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 20)
                },
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () => _loginPressed(localContext),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 20),
                      )),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _welcomeWidget() {
    return const Text('Welcome!', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold));
  }

  void _loginPressed(BuildContext localContext) {
    if (_formKey.currentState?.validate() ?? false) {
      localContext.read<LoginBloc>().add(LoginPressedEvent(emailTextController.text, pwdTextController.text));
    }
  }
}
