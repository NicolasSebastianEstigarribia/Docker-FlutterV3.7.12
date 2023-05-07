import 'package:flutter/material.dart';
import 'package:movie_admin/view_models/movie_detail_model.dart';
import 'package:provider/provider.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 10,
      child: Semantics(
        label: 'Go Back',
        child: IconButton(
          onPressed: () {
            Provider.of<MoviesDetailModel>(context, listen: false).clear();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 45,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
