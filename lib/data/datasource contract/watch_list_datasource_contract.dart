import 'package:movies_application/domain/entities/movie_model.dart';

abstract class WatchListDatasourceContract {
   Stream<List<MovieModel>?> getWatchListMovies();
  Future<void> addFavMovie(MovieModel movieModel);
  Future<void> deleteFavMovie(MovieModel movieModel);
}
