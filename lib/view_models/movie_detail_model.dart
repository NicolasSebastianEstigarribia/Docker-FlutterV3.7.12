import 'package:flutter/material.dart';
import 'package:movie_admin/models/movie.dart';
import 'package:movie_admin/services/api_utils.dart';

import '../utils/functions.dart';

class MoviesDetailModel with ChangeNotifier {
  Movie? _movie;

  Movie? get movie => _movie;

  void updateMovie(Movie newMovie) {
    _movie = newMovie;
    notifyListeners();
  }

  void clearValue() {
    _movie = null;
    notifyListeners();
  }

  void getData(String imdbID) async {
    String apiKey = getApiKey();
    String url = 'https://www.omdbapi.com/?apikey=$apiKey&i=$imdbID';

    final response = await fetchResponse(url);
    Movie movieObtained = Movie.fromJson(response);
    return Future.delayed(const Duration(milliseconds: 700), () {
      updateMovie(movieObtained);
      notifyListeners();
    });
  }
}
