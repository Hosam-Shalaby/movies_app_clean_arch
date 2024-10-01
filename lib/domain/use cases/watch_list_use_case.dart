import 'package:injectable/injectable.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
import 'package:movies_application/domain/repository%20contract/watch_list_repository_contract.dart';

@injectable
class WatchListUseCase {
  WatchListRepositoryContract watchListRepositoryContract;
  @factoryMethod
  WatchListUseCase({required this.watchListRepositoryContract});

  Stream<List<MovieModel>?> getWatchListMovies() {
    return watchListRepositoryContract.getWatchListMovies();
  }

  Future<void> addFavMovie(MovieModel movieModel) {
    return watchListRepositoryContract.addFavMovie(movieModel);
  }

  Future<void> deleteFavMovie(MovieModel movieModel) {
    return watchListRepositoryContract.deleteFavMovie(movieModel);
  }
}
