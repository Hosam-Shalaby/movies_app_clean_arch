import 'package:injectable/injectable.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
import 'package:movies_application/domain/repository%20contract/search_repository_contract.dart';

@injectable
class SearchUseCase {
  SearchRepositoryContract searchRepositoryContract;
  @factoryMethod
  SearchUseCase({required this.searchRepositoryContract});

  Future<List<MovieModel>?>invoke(String movieName) {
    return searchRepositoryContract.getSearchMovies(movieName);
  }
}
