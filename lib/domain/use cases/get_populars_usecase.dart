import 'package:injectable/injectable.dart';
import 'package:movies_application/domain/entities/movie_model.dart';


import '../repository contract/popular_repository_contract.dart';

@injectable
class GetPopularsUseCase {
  
  PopularRepositoryContract popularRepositoryContract;
@factoryMethod
  GetPopularsUseCase({required this.popularRepositoryContract});
  Future<List<MovieModel>?>invoke(){

    return popularRepositoryContract.getPopularMovies();
  }
  
}