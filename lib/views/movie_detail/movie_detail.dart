import 'package:flutter/material.dart';
import 'package:movie_admin/view_models/movie_detail_model.dart';
import 'package:movie_admin/views/movie_detail/resourse/info_movie.dart';
import 'package:movie_admin/views/movie_detail/resourse/decription_movie.dart';
import 'package:movie_admin/views/movie_detail/resourse/deparment_movie.dart';
import 'package:movie_admin/views/movie_detail/widget/arrow_back.dart';
import 'package:movie_admin/widgets/network_image.dart';
import 'package:movie_admin/widgets/spinner_widget.dart';
import 'package:provider/provider.dart';

import 'widget/degrate_top_view.dart';

class MovieDetail extends StatefulWidget {
  final String imdbID;
  const MovieDetail({super.key, required this.imdbID});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  void initState() {
    super.initState();
    Provider.of<MoviesDetailModel>(context, listen: false)
        .getData(widget.imdbID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MoviesDetailModel>(
        builder: (context, viewModel, child) {
          return viewModel.movie.title != null
              ? SingleChildScrollView(
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
                              viewModel.movie.poster!,
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 1.5,
                            ),
                          ),
                          InfoMovie(movie: viewModel.movie),
                          const DegradeTopView(),
                          const ArrowBack(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            DescriptionMovie(
                                description: viewModel.movie.plot!),
                            const SizedBox(height: 10),
                            
                            const SizedBox(height: 10),
                            DeparmentMovie(movie: viewModel.movie),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                )
              : const SpinnerWidget();
        },
      ),
    );
  }
}
