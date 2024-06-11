import 'package:movies/core/network_layer/firebase_utils.dart';

import '../models/details_model.dart';
import '../models/movie_model.dart';
import 'network_layer/api_manager.dart';

class Constants {
  static const String apiKey = '7bfad8b3e1221a197a2bc66354e68c0c';

  static const String baseURL = 'api.themoviedb.org';

  static const String popularEndPoint = '/3/movie/popular';

  static const String newReleaseEndPoint = '/3/movie/upcoming';

  static const String recommendedEndPoint = '/3/movie/top_rated';

  static const String searchEndPoint = '/3/search/movie';

  static const String categoriesEndPoint = '/3/genre/movie/list';

  static const String discoverMoviesEndPoint = '/3/discover/movie';

  static const String imageBaseURL = 'https://image.tmdb.org/t/p/w500';

  static List<MovieModel> favoriteMovies = [];

  static getFavoriteMovies() async {
    favoriteMovies = await FirestoreUtils.getDataFromFirestore();
  }

  static Future<DetailsModel> getMovieDetails(MovieModel movie) async {
    return await ApiManager.fetchDetails(movie.id!);
  }

  static String getMovieDuration(int durationInMinutes) {
    Duration duration = Duration(minutes: durationInMinutes);

    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);

    return '${hours}h ${minutes}m';
  }

  static String getMovieReleaseYear(String releaseDate) {
    return releaseDate.split('-')[0];
  }
}
