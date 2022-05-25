import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/login_provider.dart';

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
          child: context.watch<LoginProvider>().loginInfo.token != null ? _welcomeWidget() : _loginWidget()),
    );
  }

  Widget _loginWidget() {
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
                // "password": "s"
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
                if (context.watch<LoginProvider>().loginInfo.errorMsg != null) ...{
                  Text(
                    context.watch<LoginProvider>().loginInfo.errorMsg!,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 20)
                },
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () => _loginPressed(),
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

  void _loginPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<LoginProvider>().login(email: emailTextController.text, password: pwdTextController.text);
    }
  }
}
