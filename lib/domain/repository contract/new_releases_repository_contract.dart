import 'package:movies_application/domain/entities/movie_model.dart';

abstract class NewReleasesRepositoryContract {
  Future<List<MovieModel>?>getNewReleaseMovies();
}