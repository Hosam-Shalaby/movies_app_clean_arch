import 'package:movies_application/domain/entities/movie_model.dart';

sealed class SearchsState {}

class SearchLoading extends SearchsState {
  String? message;

  SearchLoading({required this.message});
}

class SearchError extends SearchsState {
  String? errorMessage;

  SearchError({this.errorMessage});
}

class SearchSuccess extends SearchsState {
  List<MovieModel>? searchsList;

  SearchSuccess({this.searchsList});
}
