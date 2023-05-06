import 'package:flutter/material.dart';

class DegradeTopView extends StatelessWidget {
  const DegradeTopView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.83,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.transparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.0,
            0.3
          ], // Puedes ajustar los valores de los stops según tus necesidades
        ),
      ),
    );
  }
}
