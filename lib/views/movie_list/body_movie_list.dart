import 'package:flutter/material.dart';
import 'package:movie_admin/models/movies.dart';

import 'package:movie_admin/view_models/movie_list_model.dart';
import 'package:movie_admin/views/movie_list/card_movie_search.dart';
import 'package:movie_admin/widgets/spinner_widget.dart';
import 'package:provider/provider.dart';

class BodyMovieList extends StatelessWidget {
  const BodyMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Obtenemos las peliculas
    Provider.of<MyMoviesModel>(context, listen: false).getData();

    return SafeArea(
      child: Consumer<MyMoviesModel>(builder: (context, viewModel, child) {
        return Column(
          children: [
            Expanded(
              child: (viewModel.movies.isNotEmpty)
                  ? GridViewMovies(movies: viewModel.movies)
                  : const SpinnerWidget(),
            ),
            //lowerKeypad(viewModel.pagenumber),
          ],
        );
      }),
    );
  }
}

class GridViewMovies extends StatefulWidget {
  final List<Search> movies;

  const GridViewMovies({super.key, required this.movies});

  @override
  State<GridViewMovies> createState() => _GridViewMoviesState();
}

class _GridViewMoviesState extends State<GridViewMovies> {
  final _scrollController = ScrollController();

  
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      Provider.of<MyMoviesModel>(context, listen: false).getData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 172, // Establece la longitud máxima de la celda
        childAspectRatio: 0.7, // Establece la relación de aspecto de la celda
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: widget.movies.length,
      itemBuilder: (BuildContext ctx, index) {
        Search item = widget.movies[index];

        return CardMovieSearch(item: item);
      },
    );
  }
}
