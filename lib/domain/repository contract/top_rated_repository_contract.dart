import 'package:movies_application/domain/entities/movie_model.dart';

abstract class TopRatedRepositoryContract {
  Future<List<MovieModel>?> getTopRatedMovies();
}
