import 'package:injectable/injectable.dart';

import 'package:movies_application/data/network/Api/api_manager.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
import '../datasource contract/popular_datasource_contract.dart';

@Injectable(as: PopularDatasourceContract)
class PopularDatasourceImpl extends PopularDatasourceContract {
  ApiManager apiManager = ApiManager();
  @factoryMethod
  PopularDatasourceImpl({required this.apiManager});
  @override
  Future<List<MovieModel>?> getPopularMovies() async {
    var response = await apiManager.getPopularMovies();
    return response.results?.map((e) => e.toMovieModel()).toList();
  }
}
