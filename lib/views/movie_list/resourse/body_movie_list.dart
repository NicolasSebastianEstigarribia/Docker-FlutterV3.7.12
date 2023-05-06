import 'package:flutter/material.dart';

import 'package:movie_admin/view_models/movie_list_model.dart';
import 'package:movie_admin/views/movie_list/resourse/animated_list_view.dart';

import 'package:movie_admin/widgets/spinner_widget.dart';
import 'package:provider/provider.dart';

class BodyMovieList extends StatelessWidget {
  const BodyMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Obtenemos las peliculas
    Provider.of<MoviesListModel>(context, listen: false).getData();

    return SafeArea(
      child: Consumer<MoviesListModel>(builder: (context, viewModel, child) {
        return Column(
          children: [
            Expanded(
              child: (viewModel.movies.isNotEmpty)
                  ? AnimateListView(movies: viewModel.movies)
                  : const SpinnerWidget(),
            ),
            //lowerKeypad(viewModel.pagenumber),
          ],
        );
      }),
    );
  }
}
