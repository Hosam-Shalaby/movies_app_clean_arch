import 'package:injectable/injectable.dart';
import 'package:movies_application/data/datasource%20contract/search_datasource_contract.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
import 'package:movies_application/domain/repository%20contract/search_repository_contract.dart';

@Injectable(as: SearchRepositoryContract)
class SearchRepositoryImpl extends SearchRepositoryContract {
  SearchDatasourceContract searchDatasourceContract;
  @factoryMethod
  SearchRepositoryImpl({required this.searchDatasourceContract});

  @override
  Future<List<MovieModel>?> getSearchMovies(String movieName) {
    return searchDatasourceContract.getSearchMovies(movieName);
  }
}
