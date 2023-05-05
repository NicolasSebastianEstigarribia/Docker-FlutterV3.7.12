import 'package:flutter/material.dart';
import 'package:movie_admin/utils/colors.dart';
import 'package:movie_admin/view_models/auth_model.dart';
import 'package:movie_admin/views/login/header_login.dart';
import 'package:movie_admin/widgets/text_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
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
          ),
          const SizedBox(height: 20),
          PTextField(
            textEditingController: _passwordController,
            hintText: "Password",
            textInputType: TextInputType.text,
            icon: Icons.lock,
          ),
          const SizedBox(
            height: 25,
          ),
          const ButtonLogin(),
        ],
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthViewModel>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
          color: lightBlue,
        ),
        child: TextButton(
          onPressed: auth.login,
          child: const Text(
            "Login",
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
