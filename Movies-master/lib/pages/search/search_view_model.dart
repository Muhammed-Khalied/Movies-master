import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../core/constants.dart';
import '../../core/network_layer/api_manager.dart';
import '../../core/network_layer/firebase_utils.dart';
import '../../models/movie_model.dart';

class SearchViewModel extends ChangeNotifier {
  String _searchQuery = '';
  List<MovieModel> _movies = [];

  String get searchQuery => _searchQuery;

  List<MovieModel> get movies => _movies;

  SearchViewModel() {
    Constants.getFavoriteMovies();
  }

  changeSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  getMovies(String query) async {
    _searchQuery = query;

    try {
      var response = await ApiManager.search(query: query);
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
