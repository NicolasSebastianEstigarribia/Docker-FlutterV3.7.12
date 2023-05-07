import 'package:flutter/material.dart';
import 'package:movie_admin/utils/colors.dart';

class ButtonLogin extends StatefulWidget {
  final Function() onPressed;
  const ButtonLogin({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<ButtonLogin> createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: lightBlue,
        ),
        child: Semantics(
          button: true,
          enabled: true,
          onTapHint: 'Log in',
          child: TextButton(
            onPressed: widget.onPressed,

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
      ),
    );
  }
}
