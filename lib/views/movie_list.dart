import 'package:flutter/material.dart';
import 'package:movie_admin/models/movies.dart';
import 'package:movie_admin/utils/colors.dart';

import 'package:movie_admin/view_models/my_movies_model.dart';
import 'package:movie_admin/widgets/spinner.dart';
import 'package:provider/provider.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  MovieListState createState() {
    return MovieListState();
  }
}

class MovieListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();
    Provider.of<MyMoviesModel>(context, listen: false).getData(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        title: const Text(
          'Movies',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const MovieTitle(Colors.blue),
            Consumer<MyMoviesModel>(builder: (context, viewModel, child) {
              return (viewModel.movies.search != null)
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: viewModel.movies.search!.length,
                        itemBuilder: (context, i) {
                          return ElevatedButton(
                            child: MovieCell(viewModel.movies.search![i]),
                            onPressed: () {},
                            //color: Colors.white,
                          );
                        },
                      ),
                    )
                  : const SpinnerWidget();
            }),
          ],
        ),
      ),
    );
  }
}

class MovieTitle extends StatelessWidget {
  final Color mainColor;

  const MovieTitle(this.mainColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: Text(
        'Top Rated',
        style: TextStyle(
          fontSize: 40.0,
          color: mainColor,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class MovieCell extends StatelessWidget {
  final Search movie;
  const MovieCell(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage(movie.poster!), fit: BoxFit.cover),
                  boxShadow: const [
                    BoxShadow(blurRadius: 5.0, offset: Offset(2.0, 5.0))
                  ],
                ),
                child:
                    Image.network(movie.poster!, width: 100.0, height: 100.0),
              ),
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title!,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(2.0)),
                  Text(
                    movie.imdbID!,
                    maxLines: 3,
                  )
                ],
              ),
            )),
          ],
        ),
        Container(
          width: 300.0,
          height: 0.5,
          color: const Color(0xD2D2E1ff),
          margin: const EdgeInsets.all(16.0),
        )
      ],
    );
  }
}
