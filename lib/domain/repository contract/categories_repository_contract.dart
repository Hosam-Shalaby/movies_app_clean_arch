import 'package:movies_application/domain/entities/genre_model.dart';

abstract class CategoriesRepositoryContract {
  Future<List<GenreModel>?> getCategories();
}
