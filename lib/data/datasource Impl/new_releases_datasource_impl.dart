import 'package:injectable/injectable.dart';
import 'package:movies_application/data/datasource%20contract/new_releases_datasource_contract.dart';
import 'package:movies_application/data/network/Api/api_manager.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
@Injectable(as : NewReleasesDatasourceContract)
class NewReleasesDatasourceImpl extends NewReleasesDatasourceContract {
  ApiManager apiManager;
@factoryMethod
  NewReleasesDatasourceImpl({required this.apiManager});

  @override
  Future<List<MovieModel>?> getNewReleaseMovies() async {
    var response = await apiManager.getNewReleases();
    return response.results?.map((e) => e.toMovieModel()).toList();
  }
}
