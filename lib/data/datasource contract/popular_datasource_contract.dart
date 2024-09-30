
import 'package:movies_application/domain/entities/movie_model.dart';

abstract class PopularDatasourceContract {
Future<List<MovieModel>?>  getPopularMovies();
}