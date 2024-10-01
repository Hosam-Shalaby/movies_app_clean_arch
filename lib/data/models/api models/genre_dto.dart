import 'package:movies_application/domain/entities/genre_model.dart';

class GenreDto {
  final int id;
  final String name;

  GenreDto({
    required this.id,
    required this.name,
  });

  factory GenreDto.fromJson(Map<String, dynamic> json) {
    return GenreDto(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
    GenreModel toGenreModel() {
    return GenreModel(id: id, name: name);
  }
}




