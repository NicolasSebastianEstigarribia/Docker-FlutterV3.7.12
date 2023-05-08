
import 'package:flutter/material.dart';
import 'package:movie_admin/models/movie.dart';
import 'package:movie_admin/views/movie_detail/resourse/decription_movie.dart';
import 'package:movie_admin/views/movie_detail/resourse/deparment_movie.dart';
import 'package:movie_admin/views/movie_detail/resourse/info_movie.dart';
import 'package:movie_admin/views/movie_detail/widget/arrow_back.dart';
import 'package:movie_admin/views/movie_detail/widget/degrate_top_view.dart';
import 'package:movie_admin/widgets/network_image.dart';

class Detail extends StatelessWidget {
  final Movie movie;
  const Detail({
    super.key,
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    height: MediaQuery.of(context).size.height / 1.5,
                  ),
                ),
                InfoMovie(movie: movie),
                const DegradeTopView(),
                const ArrowBack(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  DescriptionMovie(
                    description: movie.plot!,
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  DepartmentMovie(movie: movie),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
  }
}
