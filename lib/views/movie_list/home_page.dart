import 'package:flutter/material.dart';
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
    Provider.of<MoviesListModel>(context, listen: false).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: Consumer<MoviesListModel>(
          builder: (context, viewModel, child) {
            return (viewModel.movies.isNotEmpty)
                ? AnimateListView(movies: viewModel.movies)
                : const SpinnerWidget();
          },
        ),
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
      centerTitle: true,
      elevation: 0.3,
    );
  }
}
