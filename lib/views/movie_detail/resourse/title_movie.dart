import 'package:flutter/material.dart';
import 'package:movie_admin/models/movie.dart';
import 'package:movie_admin/utils/functions.dart';
import 'package:movie_admin/views/movie_detail/widget/container_genre_movies.dart';

class ContainerTitleMovie extends StatelessWidget {
  const ContainerTitleMovie({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    List<String> listGenre = separateWords(movie.genre!);

    List<Widget> containerGenre = listGenre.map((palabra) {
      return Flexible(child: ContainerGenreMovie(genre: palabra));
    }).toList();

    return Container(
      width: MediaQuery.of(context).size.width / 0.3,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.title!,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 24.0),
                    Text('${movie.imdbRating!}/10'),
                  ],
                ),
              ),
              Flexible(
                child: Text('Restricted: ${movie.rated}'),
              ),
              Flexible(child: Text('${movie.released}')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Votes ${movie.imdbVotes!}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Flexible(
                child: Text('Duration: ${movie.runtime!}'),
              ),
              Flexible(
                child: Text(' ${movie.type!}'),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: containerGenre,
          ),
        ],
      ),
    );
  }
}
