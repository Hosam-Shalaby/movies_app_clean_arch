import 'package:movies_application/domain/entities/genre_model.dart';

abstract class CategoriesDatasourceContract {
  Future<List<GenreModel>?> getCategories();
}
