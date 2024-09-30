import 'package:injectable/injectable.dart';
import 'package:movies_application/data/datasource%20contract/new_releases_datasource_contract.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
import 'package:movies_application/domain/repository%20contract/new_releases_repository_contract.dart';
@Injectable(as: NewReleasesRepositoryContract)
class NewReleasesRepositoryImpl extends NewReleasesRepositoryContract {
NewReleasesDatasourceContract newReleasesDatasourceContract;
@factoryMethod
  NewReleasesRepositoryImpl({required this.newReleasesDatasourceContract});
  @override
  Future<List<MovieModel>?> getNewReleaseMovies() async {
   return newReleasesDatasourceContract.getNewReleaseMovies();
  }
}
