import 'package:flutter/material.dart';
import 'package:movie_admin/utils/colors.dart';
import 'package:movie_admin/widgets/spinner_widget.dart';

class ButtonLogin extends StatefulWidget {
  final String textLogin;
  final Function() onPressed;

  const ButtonLogin({
    Key? key,
    required this.onPressed,
    required this.textLogin,
  }) : super(key: key);

  @override
  State<ButtonLogin> createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {
  bool isLoading = false; // Variable para controlar el estado de carga

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: isLoading
          ? const SpinnerWidget() // Mostrar indicador de carga
          : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: lightBlue,
              ),
              child: Semantics(
                button: true,
                enabled: true,
                onTapHint: 'Log in',
                child: TextButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true; // Cambiar el estado de carga a true
                    });

                    await widget.onPressed();

                    setState(() {
                      isLoading =
                          false; // Cambiar el estado de carga a false después de finalizar la acción
                    });
                  },
                  child: Text(
                    widget.textLogin,
                    style: const TextStyle(
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
