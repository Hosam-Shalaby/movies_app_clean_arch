import 'package:movies_application/domain/entities/movie_model.dart';

sealed class HomeState {}

class HomeLoading extends HomeState {
  String? message;

  HomeLoading({required this.message});
}

class HomeError extends HomeState {
  String? errorMessage;

  HomeError({this.errorMessage});
}

class HomeSuccess extends HomeState {
  List<MovieModel>? popularList;
  List<MovieModel>? topRatedList;
  List<MovieModel>? newReleasesList;

  HomeSuccess({this.popularList, this.topRatedList, this.newReleasesList});
}
