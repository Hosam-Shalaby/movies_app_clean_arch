import 'package:injectable/injectable.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
import 'package:movies_application/domain/repository%20contract/watch_list_repository_contract.dart';

@injectable
class WatchListUseCase {
  WatchListRepositoryContract watchListRepositoryContract;
  @factoryMethod
  WatchListUseCase({required this.watchListRepositoryContract});

  Future<List<MovieModel>?> invoke() {
    return watchListRepositoryContract.getWatchListMovies();
  }
}
