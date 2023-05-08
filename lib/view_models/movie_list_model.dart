import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_admin/models/movies.dart';
import 'package:movie_admin/services/api_utils.dart';
import 'package:movie_admin/utils/functions.dart';

class MoviesListModel with ChangeNotifier {
  final List<Search> _movies = <Search>[];

  List<Search> get movies => _movies;

  void updateMovies(List<Search> newMovies) {
    _movies.addAll(newMovies);
    notifyListeners();
  }

  void deleteMovie(String imdbIdToRemove) {
    _movies.removeWhere((search) => search.imdbID == imdbIdToRemove);
    notifyListeners();
  }

}
