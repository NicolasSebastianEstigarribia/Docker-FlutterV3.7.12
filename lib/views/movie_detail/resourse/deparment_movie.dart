import 'package:flutter/material.dart';
import 'package:movie_admin/models/movie.dart';
import 'package:movie_admin/utils/functions.dart';

class DeparmentMovie extends StatelessWidget {
  final Movie movie;

  const DeparmentMovie({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    List<String> listDirector = separateWords(movie.director!);
    List<String> listWriter = separateWords(movie.writer!);
    List<String> listActors = separateWords(movie.actors!);

    List<Widget> director = textString(listDirector);
    List<Widget> write = textString(listWriter);
    List<Widget> actors = textString(listActors);

    return Column(
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
            Column(
              children: [
                const Text(
                  'Director',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: director,
                )
              ],
            ),
            Column(
              children: [
                const Text(
                  'Writer',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: write,
                )
              ],
            ),
            Column(
              children: [
                const Text(
                  'Actors',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: actors,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}

