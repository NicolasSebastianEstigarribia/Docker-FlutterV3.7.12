import 'package:flutter/material.dart';
import 'package:movie_admin/models/movies.dart';
import 'package:movie_admin/services/api_utils.dart';
import 'package:movie_admin/services/dummy_backend.dart';
import 'package:movie_admin/utils/functions.dart';
import 'package:movie_admin/view_models/auth_model.dart';
import 'package:movie_admin/view_models/movie_list_model.dart';

import 'package:movie_admin/widgets/spinner_widget.dart';
import 'package:provider/provider.dart';

import 'resourse/animated_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    String apiKey = getApiKey();
    String url = 'https://www.omdbapi.com/?apikey=$apiKey&s=movie';

    try {
      // Código que puede generar una excepción
      final response = await fetchResponse(url);
      Movies movies = Movies.fromJson(response);
      List<Search> listSearch = movies.search!;
      Provider.of<MoviesListModel>(context, listen: false)
          .updateMovies(listSearch);
    } catch (e) {
      // Manejo de la excepción
      alert(context, 'Error', e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Consumer<MoviesListModel>(
        builder: (context, viewModel, child) {
          return (viewModel.movies.isNotEmpty)
              ? AnimateListView(movies: viewModel.movies)
              : const SpinnerWidget();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Movies',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.exit_to_app),
        onPressed: Provider.of<AuthViewModel>(context, listen: false).logout,
      ),
      centerTitle: true,
      elevation: 0.3,
    );
  }
}
