import 'package:flutter/material.dart';
import 'package:movie_admin/utils/colors.dart';
import 'package:movie_admin/views/movie_list/resourse/body_movie_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue.withAlpha(50),
      appBar: appBar(),
      body: const BodyMovieList(),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Movies',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: 0.3,
    );
  }
}
