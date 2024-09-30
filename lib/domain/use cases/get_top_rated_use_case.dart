import 'package:injectable/injectable.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
import 'package:movies_application/domain/repository%20contract/top_rated_repository_contract.dart';
@injectable
class GetTopRatedUseCase {
  TopRatedRepositoryContract topRatedRepositoryContract;
  @factoryMethod
  GetTopRatedUseCase({required this.topRatedRepositoryContract});
  Future<List<MovieModel>?> invoke()  {
    return  topRatedRepositoryContract.getTopRatedMovies();
  }
}