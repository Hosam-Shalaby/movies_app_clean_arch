import 'package:movies_application/domain/entities/movie_model.dart';

abstract class PopularRepositoryContract {
  Future<List<MovieModel>?> getPopularMovies();
}