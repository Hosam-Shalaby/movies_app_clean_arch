import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
import 'package:movies_application/domain/use%20cases/get_new_releases_use_case.dart';
import 'package:movies_application/domain/use%20cases/get_top_rated_use_case.dart';
import 'package:movies_application/domain/use%20cases/watch_list_use_case.dart';
import 'package:movies_application/presentation/view%20model/states/watch_list_state.dart';

import '../../../domain/use cases/get_populars_usecase.dart';
import '../states/home_state.dart';

@injectable
class WatchListCubit extends Cubit<WatchListState> {
  WatchListUseCase getWatchListUseCase;
  StreamSubscription<List<MovieModel>?>? watchListSubscription;

  @factoryMethod
  WatchListCubit({required this.getWatchListUseCase})
      : super(WatchListLoading(message: 'Loading....'));
  // void getWatchListMovies() async {
  //   emit(WatchListLoading(message: 'Loading....'));
  //   try {
  //     var watchList = getWatchListUseCase.getWatchListMovies();

  //     emit(WatchListSuccess(watchList: watchList));
  //   } catch (e) {
  //     emit(WatchListError(errorMessage: e.toString()));
  //   }
  // }
void getWatchListMovies() {
    emit(WatchListLoading(message: 'Loading....'));
    watchListSubscription = getWatchListUseCase.getWatchListMovies().listen((watchList) {
      emit(WatchListSuccess(watchList: watchList));
    }, onError: (error) {
      emit(WatchListError(errorMessage: error.toString()));
    });
  }
  void addFavMovie(MovieModel movieModel) async {
    
      await getWatchListUseCase.addFavMovie(movieModel);
     watchListSubscription = getWatchListUseCase.getWatchListMovies().listen((watchList) {
      emit(WatchListSuccess(watchList: watchList));
    }, onError: (error) {
      emit(WatchListError(errorMessage: error.toString()));
    });
  }

  void deleteFavMovie(MovieModel movieModel) async {
   
      await getWatchListUseCase.deleteFavMovie(movieModel);
     watchListSubscription = getWatchListUseCase.getWatchListMovies().listen((watchList) {
      emit(WatchListSuccess(watchList: watchList));
    }, onError: (error) {
      emit(WatchListError(errorMessage: error.toString()));
    });
  }
   @override
  Future<void> close() {
    watchListSubscription?.cancel(); // تأكد من إلغاء الاشتراك عند إغلاق الكلاس
    return super.close();
  }
}
