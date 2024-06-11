import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../core/network_layer/api_manager.dart';
import '../../core/network_layer/firebase_utils.dart';
import '../../models/genre_model.dart';
import '../../models/movie_model.dart';

class BrowseViewModel extends ChangeNotifier {
  List<GenreModel> _genres = [];
  List<MovieModel> _movies = [];

  List<GenreModel> get genres => _genres;

  List<MovieModel> get movies => _movies;

  BrowseViewModel() {
    Constants.getFavoriteMovies();
  }

  getGenres() async {
    try {
      var response = await ApiManager.fetchCategories();
      _genres = response.genres;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  getMovies(int selectedGenreId) async {
    try {
      var response =
          await ApiManager.discoverMoviesByGenre(genreId: selectedGenreId);

      _movies = response.results!;

      for (int i = 0; i < _movies.length; i++) {
        for (int j = 0; j < Constants.favoriteMovies.length; j++) {
          if (_movies[i].id == Constants.favoriteMovies[j].id) {
            _movies[i].isFavorite = true;
            break;
          }
        }
      }

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  bookmarkButtonPressed(MovieModel model) async {
    model.isFavorite = !(model.isFavorite!);
    (model.isFavorite!)
        ? FirestoreUtils.addDataToFirestore(model)
        : FirestoreUtils.deleteDataFromFirestore(model.id!);
    notifyListeners();
  }
}
