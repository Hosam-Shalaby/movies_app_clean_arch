import 'package:injectable/injectable.dart';
import 'package:movies_application/data/datasource%20contract/categories_datasource_contract.dart';
import 'package:movies_application/data/network/Api/api_manager.dart';
import 'package:movies_application/domain/entities/genre_model.dart';

@Injectable(as: CategoriesDatasourceContract)
class CategoriesDatasourceImpl extends CategoriesDatasourceContract {
  ApiManager apiManager;
  @factoryMethod
  CategoriesDatasourceImpl({required this.apiManager});

  @override
  Future<List<GenreModel>?> getCategories() async {
    var response = await apiManager.getCategories();
    return response.genres.map((e) => e.toGenreModel()).toList();
  }
}
