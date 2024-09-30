import 'package:injectable/injectable.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
import 'package:movies_application/domain/repository%20contract/movie_details_repository_contract.dart';

@injectable
class GetMovieDetailsUseCase {
  MovieDetailsRepositoryContract movieDetailsRepositoryContract;
  @factoryMethod
  GetMovieDetailsUseCase({required this.movieDetailsRepositoryContract});
  Future<List<MovieModel>?> invoke(int? movieId) {
    return movieDetailsRepositoryContract.getMovieDetails(movieId);
  }
}
