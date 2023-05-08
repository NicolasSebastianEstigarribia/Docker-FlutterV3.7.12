import 'package:flutter/material.dart';
import 'package:movie_admin/models/movie.dart';
import 'package:movie_admin/views/movie_detail/resourse/decription_movie.dart';
import 'package:movie_admin/views/movie_detail/resourse/deparment_movie.dart';

import 'package:movie_admin/views/movie_detail/widget/arrow_back.dart';

import 'package:movie_admin/widgets/network_image.dart';

import 'widget/container_title_movie.dart';

class Detail extends StatelessWidget {
  final Movie movie;
  const Detail({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              child: PNetworkImage(
                movie.poster!,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
              ),
            ),
            const ArrowBack(),
          ],
        ),
        Transform.translate(
          offset: const Offset(
              0, -90), // Valor negativo para mover el Container hacia arriba
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ContainerTitleMovie(movie: movie),
                DescriptionMovie(
                  description: movie.plot!,
                ),
                const SizedBox(height: 20),
                DepartmentMovie(movie: movie),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
