import 'package:flutter/material.dart';
import 'package:movie_admin/utils/colors.dart';
import 'package:movie_admin/views/movie_list/body_movie_list.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  dynamic provider;

  @override
  void initState() {
    super.initState();
  }

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
      backgroundColor: lightBlue.withAlpha(100),
      title: const Text(
        'Movies',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: 0.3,
    );
  }
}
