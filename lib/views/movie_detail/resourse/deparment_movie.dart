import 'package:flutter/material.dart';
import 'package:movie_admin/models/movie.dart';
import 'package:movie_admin/utils/functions.dart';

class DepartmentMovie extends StatelessWidget {
  final Movie movie;

  const DepartmentMovie({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> listDirector = separateWords(movie.director!);
    List<String> listWriter = separateWords(movie.writer!);
    List<String> listActors = separateWords(movie.actors!);

    List<Widget> director = textString(listDirector);
    List<Widget> writer = textString(listWriter);
    List<Widget> actors = textString(listActors);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Department',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildColumnWithTitle('Director', director),
            ),
            Expanded(
              child: _buildColumnWithTitle('Writer', writer),
            ),
            Expanded(
              child: _buildColumnWithTitle('Actors', actors),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildColumnWithTitle(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items,
        ),
      ],
    );
  }
}
