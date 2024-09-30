import 'package:injectable/injectable.dart';
import 'package:movies_application/data/datasource%20contract/movie_details_datasource_contract.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
import 'package:movies_application/domain/repository%20contract/movie_details_repository_contract.dart';

@Injectable(as: MovieDetailsRepositoryContract)
class MovieDetailsRepositoryImpl extends MovieDetailsRepositoryContract {
  MovieDetailsDatasourceContract movieDetailsDatasourceContract;
  @factoryMethod
  MovieDetailsRepositoryImpl({required this.movieDetailsDatasourceContract});

  @override
  Future<List<MovieModel>?> getMovieDetails(int? movieId) {
    return movieDetailsDatasourceContract.getMovieDetails(movieId);
  }
}
