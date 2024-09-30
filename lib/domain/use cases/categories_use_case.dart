import 'package:injectable/injectable.dart';
import 'package:movies_application/domain/entities/genre_model.dart';
import 'package:movies_application/domain/repository%20contract/categories_repository_contract.dart';

@injectable
class CategoriesUseCase {
  CategoriesRepositoryContract categoriesRepositoryContract;
  @factoryMethod
  CategoriesUseCase({required this.categoriesRepositoryContract});

 Future<List<GenreModel>?> invoke() {
    return categoriesRepositoryContract.getCategories();
  }
}
