import 'package:movies_application/domain/entities/genre_model.dart';

sealed class CategoriesState {}

class CategoriesLoading extends CategoriesState {
  String? message;
  CategoriesLoading({required this.message});
}

class CategoriesError extends CategoriesState {
  String? message;
  CategoriesError({this.message});
}

class CategoriesSuccess extends CategoriesState {
  List<GenreModel>? categories;
  CategoriesSuccess({this.categories});
}
