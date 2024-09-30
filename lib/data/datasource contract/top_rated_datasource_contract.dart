import 'package:movies_application/domain/entities/movie_model.dart';

abstract class TopRatedDatasourceContract {
  Future<List<MovieModel>?> getTopRatedMovies();
}