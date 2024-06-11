class DetailsModel {
  bool? adult;
  String? backdropPath;
  List<dynamic>? genres;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  int? runtime;
  String? status;
  String? title;
  bool? video;
  num? voteAverage;
  int? voteCount;
  bool isFavorite;

  DetailsModel({
    this.adult,
    this.backdropPath,
    this.genres,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.runtime,
    this.status,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.isFavorite = false,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genres: json['genres'],
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      status: json['status'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genres': genres,
      'id': id,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'runtime': runtime,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'is_favorite': true,
    };
  }

  factory DetailsModel.fromFirestore(Map<String, dynamic> json) {
    return DetailsModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genres: json['genres'],
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      isFavorite: json['is_favorite'],
    );
  }
}