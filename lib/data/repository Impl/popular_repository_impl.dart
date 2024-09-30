import 'package:injectable/injectable.dart';
import 'package:movies_application/data/datasource%20contract/popular_datasource_contract.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
import '../../domain/repository contract/popular_repository_contract.dart';
@Injectable(as: PopularRepositoryContract)
class PopularRepositoryImpl extends PopularRepositoryContract {
  PopularDatasourceContract popularDatasourceContract;
  @factoryMethod
  PopularRepositoryImpl({required this.popularDatasourceContract});
  @override
  Future<List<MovieModel>?> getPopularMovies() {
    return popularDatasourceContract.getPopularMovies();
  }
}
