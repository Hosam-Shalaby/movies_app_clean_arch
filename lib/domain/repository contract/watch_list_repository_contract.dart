import 'package:movies_application/domain/entities/movie_model.dart';

abstract class WatchListRepositoryContract {
  Stream<List<MovieModel>?> getWatchListMovies();
  Future<void> addFavMovie(MovieModel movieModel);
  Future<void> deleteFavMovie(MovieModel movieModel);
}
