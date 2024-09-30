import 'package:movies_application/domain/entities/movie_model.dart';

abstract class NewReleasesDatasourceContract {
  Future<List<MovieModel>?>getNewReleaseMovies();
}