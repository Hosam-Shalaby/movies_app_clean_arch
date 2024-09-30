import 'package:injectable/injectable.dart';
import 'package:movies_application/data/datasource%20contract/top_rated_datasource_contract.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
import 'package:movies_application/domain/repository%20contract/top_rated_repository_contract.dart';

@Injectable(as: TopRatedRepositoryContract)
class TopRatedRepositoryImpl extends TopRatedRepositoryContract {
  TopRatedDatasourceContract topRatedDatasourceContract;
  @factoryMethod
  TopRatedRepositoryImpl({required this.topRatedDatasourceContract});
  @override
  Future<List<MovieModel>?> getTopRatedMovies() async {
    return topRatedDatasourceContract.getTopRatedMovies();
  }
}
