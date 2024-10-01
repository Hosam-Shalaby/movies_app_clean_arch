import 'package:movies_application/domain/entities/movie_model.dart';

abstract class MovieDetailsRepositoryContract {
 Future<List<MovieModel>?> getMovieDetails(int movieId);
}