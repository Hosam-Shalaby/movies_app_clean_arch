import 'package:injectable/injectable.dart';
import 'package:movies_application/data/datasource%20contract/categories_datasource_contract.dart';
import 'package:movies_application/domain/entities/genre_model.dart';
import 'package:movies_application/domain/repository%20contract/categories_repository_contract.dart';

@Injectable(as: CategoriesRepositoryContract)
class CategoriesRepositoryImpl extends CategoriesRepositoryContract {
  CategoriesDatasourceContract categoriesDatasourceContract;
  @factoryMethod
  CategoriesRepositoryImpl({required this.categoriesDatasourceContract});

  @override
  Future<List<GenreModel>?> getCategories() {
    return categoriesDatasourceContract.getCategories();
  }
}
