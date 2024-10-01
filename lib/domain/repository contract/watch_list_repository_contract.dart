import 'package:movies_application/domain/entities/movie_model.dart';

abstract class WatchListRepositoryContract {
  Future<List<MovieModel>?> getWatchListMovies();
}
