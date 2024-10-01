import 'package:movies_application/domain/entities/movie_model.dart';

sealed class WatchListState {}

class WatchListLoading extends WatchListState {
  String? message;

  WatchListLoading({required this.message});
}

class WatchListError extends WatchListState {
  String? errorMessage;

  WatchListError({this.errorMessage});
}

class WatchListSuccess extends WatchListState {
  List<MovieModel>? watchList;

  WatchListSuccess({this.watchList});
}
