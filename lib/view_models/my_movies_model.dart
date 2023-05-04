import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_admin/models/movie.dart';
import 'package:movie_admin/utils/globals.dart';

import '../utils/config.dart';

class MyMoviesModel with ChangeNotifier {
  Movies _movies = Movies();

  Movies get movies => _movies;

  void updateMovies(Movies newMovies) {
    _movies = newMovies;
    notifyListeners();
  }

  void getData() async {
    String apiKey = getApiKey();
    String url = 'https://www.omdbapi.com/?apikey=$apiKey&s=movie';

    final response = await fetchResponse(url);
    Movies movi = Movies.fromJson(response);
    updateMovies(movi);
    notifyListeners();
  }
  
}
