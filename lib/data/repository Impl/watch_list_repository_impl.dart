import 'package:injectable/injectable.dart';
import 'package:movies_application/data/datasource%20contract/watch_list_datasource_contract.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
import 'package:movies_application/domain/repository%20contract/watch_list_repository_contract.dart';
@Injectable(as: WatchListRepositoryContract)
class WatchListRepositoryImpl extends WatchListRepositoryContract {
  WatchListDatasourceContract watchListDatasourceContract;
  @factoryMethod
  WatchListRepositoryImpl({required this.watchListDatasourceContract});
  @override
  Future<List<MovieModel>?> getWatchListMovies() {
    return watchListDatasourceContract.getWatchListMovies();
  }
  
}