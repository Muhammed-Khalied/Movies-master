class GenreModel {
  final int id;
  final String name;
  String? imagePath;

  GenreModel({
    required this.id,
    required this.name,
    this.imagePath = 'assets/images/thumbnail.png',
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'],
      name: json['name'],
      imagePath: json['imagePath'] ?? 'assets/images/thumbnail.png',
    );
  }
}
