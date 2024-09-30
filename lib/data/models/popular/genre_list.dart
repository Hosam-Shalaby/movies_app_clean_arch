import 'package:movies_application/data/models/popular/genre_dto.dart';

class GenresList {
  final List<GenreDto> genres;

  GenresList({
    required this.genres,
  });

  factory GenresList.fromJson(Map<String, dynamic> json) {
    return GenresList(
      genres:
          List<GenreDto>.from(json['genres'].map((x) => GenreDto.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'genres': genres.map((x) => x.toJson()).toList(),
    };
  }
}
