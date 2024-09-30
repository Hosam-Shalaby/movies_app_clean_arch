import 'package:movies_application/domain/entities/movie_model.dart';

abstract class SearchDatasourceContract {
  Future<List<MovieModel>?> getSearchMovies(String movieName);
}
