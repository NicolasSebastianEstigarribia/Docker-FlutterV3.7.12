import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_admin/models/movies.dart';
import 'package:movie_admin/utils/globals.dart';

import '../utils/config.dart';

class MyMoviesModel with ChangeNotifier {
  Movies _movies = Movies();

  Movies get movies => _movies;

  void updateMovies(Movies newMovies) {
    _movies = newMovies;
    notifyListeners();
  }

  void getData(int page) async {
    String pag = page.toString();
    String apiKey = getApiKey();
    String url = 'https://www.omdbapi.com/?apikey=$apiKey&s=movie&page=$pag';

    final response = await fetchResponse(url);
    Movies movi = Movies.fromJson(response);
    updateMovies(movi);
    notifyListeners();
  }
  
}
