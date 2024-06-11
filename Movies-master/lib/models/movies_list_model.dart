import 'genre_model.dart';

class MoviesListModel {
  final List<GenreModel> genres;

  MoviesListModel({
    required this.genres,
  });

  factory MoviesListModel.fromJson(Map<String, dynamic> json) {
    return MoviesListModel(
        genres: (json['genres'] as List)
            .map((e) => GenreModel.fromJson(e))
            .toList());
  }
}


