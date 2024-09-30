import 'package:injectable/injectable.dart';
import 'package:movies_application/data/datasource%20contract/movie_details_datasource_contract.dart';
import 'package:movies_application/data/network/Api/api_manager.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
@Injectable(as: MovieDetailsDatasourceContract)
class MovieDetailsDatasourceImpl extends MovieDetailsDatasourceContract {
  ApiManager apiManager;
  @factoryMethod
  MovieDetailsDatasourceImpl({required this.apiManager});

  @override
  Future<List<MovieModel>?> getMovieDetails(int? movieId) async {
    var response = await apiManager.getMovieDetails(movieId);
    return response.results?.map((e) => e.toMovieModel()).toList();
  }
}
