import 'package:movies_application/domain/entities/movie_model.dart';

sealed class MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {
  String? message;

  MovieDetailsLoading({required this.message});
}

class MovieDetailsError extends MovieDetailsState {
  String? errorMessage;

  MovieDetailsError({this.errorMessage});
}

class MovieDetailsSuccess extends MovieDetailsState {
  List<MovieModel>? movieDetailsList;

  MovieDetailsSuccess({this.movieDetailsList});
}
