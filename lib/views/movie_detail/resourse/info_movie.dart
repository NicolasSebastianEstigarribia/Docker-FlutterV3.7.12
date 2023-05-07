import 'package:flutter/material.dart';
import 'package:movie_admin/models/movie.dart';

import 'container_title_movie.dart';

class InfoMovie extends StatelessWidget {
  final Movie movie;

  const InfoMovie({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.6,
      left: 20,
      right: 20,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContainerTitleMovie(movie: movie),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
