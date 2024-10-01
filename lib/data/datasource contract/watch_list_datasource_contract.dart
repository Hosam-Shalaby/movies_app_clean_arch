import 'package:movies_application/domain/entities/movie_model.dart';

abstract class WatchListDatasourceContract {
  Future<List<MovieModel>?> getWatchListMovies();
}
