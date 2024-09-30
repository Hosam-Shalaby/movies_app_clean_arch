import 'package:injectable/injectable.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
import 'package:movies_application/domain/repository%20contract/new_releases_repository_contract.dart';
@injectable
class GetNewReleasesUseCase {
  NewReleasesRepositoryContract newReleasesRepositoryContract;
@factoryMethod
  GetNewReleasesUseCase({required this.newReleasesRepositoryContract});
  Future<List<MovieModel>?> invoke()  {
    return  newReleasesRepositoryContract.getNewReleaseMovies();
  }
}
