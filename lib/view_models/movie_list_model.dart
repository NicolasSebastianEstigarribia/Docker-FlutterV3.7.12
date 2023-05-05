import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_admin/models/movies.dart';
import 'package:movie_admin/utils/globals.dart';

import '../utils/config.dart';

class MyMoviesModel with ChangeNotifier {
  int _pagenumber = 0;
  List<Search> _movies = <Search>[];

  List<Search> get movies => _movies;
  int get pagenumber => _pagenumber;

  void updateMovies(List<Search> newMovies) {
    _movies.addAll(newMovies) ;
    notifyListeners();
  }

  void getData() async {
    //Actualizamos el numero de pagina.
    _pagenumber++;

    String pag    = _pagenumber.toString();
    String apiKey = getApiKey();
    String url = 'https://www.omdbapi.com/?apikey=$apiKey&s=movie&page=$pag';
    
    final response = await fetchResponse(url);
    Movies movies = Movies.fromJson(response);
    List<Search> listSearch = movies.search!;
    
    updateMovies(listSearch);
    notifyListeners();
  }
  
}
