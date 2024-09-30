import 'package:injectable/injectable.dart';
import 'package:movies_application/data/datasource%20contract/search_datasource_contract.dart';
import 'package:movies_application/data/network/Api/api_manager.dart';
import 'package:movies_application/domain/entities/movie_model.dart';

@Injectable(as: SearchDatasourceContract)
class SearchDatasourceImpl extends SearchDatasourceContract {
  ApiManager apiManager;
  @factoryMethod
  SearchDatasourceImpl({required this.apiManager});

  @override
  Future<List<MovieModel>?> getSearchMovies(String movieName) async {
    var response = await apiManager.getSearchMovies(movieName);
    return response.results?.map((e) => e.toMovieModel()).toList();
  }
}
