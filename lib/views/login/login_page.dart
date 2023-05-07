import 'package:flutter/material.dart';
import 'package:movie_admin/views/login/resourse/header_login.dart';
import 'package:movie_admin/views/login/widgets/button_login.dart';
import 'package:movie_admin/widgets/text_field.dart';
import 'package:provider/provider.dart';

import '../../view_models/auth_model.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const HeaderLoginPage(),
          const SizedBox(height: 30),
          PTextField(
            textEditingController: _emailController,
            hintText: "Email",
            textInputType: TextInputType.emailAddress,
            obscureText: false,
            icon: Icons.email,
            semanticLabel: "Email Field",
          ),
          const SizedBox(height: 20),
          PTextField(
            textEditingController: _passwordController,
            hintText: "Password",
            textInputType: TextInputType.text,
            icon: Icons.lock,
            semanticLabel: 'Password Field',
          ),
          const SizedBox(height: 25),
          ButtonLogin(onPressed: authenticate),
        ],
      ),
    );
  }

  void authenticate() {
    // Validar el email y la contraseña dummy
    if (_emailController.text == 'dummy@example.com' &&
        _passwordController.text == 'password') {
      Provider.of<AuthViewModel>(context, listen: false).login;
    } else {
      // Mostrar mensaje de error
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Invalid Credentials'),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }
}
