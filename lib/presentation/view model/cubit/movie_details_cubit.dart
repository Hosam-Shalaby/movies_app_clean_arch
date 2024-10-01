import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_application/domain/use%20cases/get_movie_details_use_case.dart';
import 'package:movies_application/presentation/view%20model/states/movie_details_state.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  GetMovieDetailsUseCase getMovieDetailsUseCase;
  @factoryMethod
  MovieDetailsCubit({required this.getMovieDetailsUseCase})
      : super(MovieDetailsLoading(message: 'Loading....'));
  void initPage(int movieId) async {
    emit(MovieDetailsLoading(message: 'Loading....'));
    try {
      var movieDetails = await getMovieDetailsUseCase.invoke(movieId);
      emit(MovieDetailsSuccess(movieDetailsList: movieDetails));
    } catch (e) {
      emit(MovieDetailsError(errorMessage: e.toString()));
    }
  }
}
