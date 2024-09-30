import 'package:injectable/injectable.dart';
import 'package:movies_application/data/datasource%20contract/top_rated_datasource_contract.dart';
import 'package:movies_application/data/network/Api/api_manager.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
@Injectable(as: TopRatedDatasourceContract)
class TopRatedDatasourceImpl extends TopRatedDatasourceContract {
  ApiManager apiManager;
  @factoryMethod
  TopRatedDatasourceImpl({required this.apiManager});
  @override
  Future<List<MovieModel>?> getTopRatedMovies() async{
   var response =await apiManager.getTopRated();
   return response.results?.map((e) => e.toMovieModel()).toList();
  }
}
