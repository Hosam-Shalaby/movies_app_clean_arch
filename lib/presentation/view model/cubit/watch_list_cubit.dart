import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_application/domain/use%20cases/get_new_releases_use_case.dart';
import 'package:movies_application/domain/use%20cases/get_top_rated_use_case.dart';
import 'package:movies_application/domain/use%20cases/watch_list_use_case.dart';
import 'package:movies_application/presentation/view%20model/states/watch_list_state.dart';

import '../../../domain/use cases/get_populars_usecase.dart';
import '../states/home_state.dart';

@injectable
class WatchListCubit extends Cubit<WatchListState> {
  WatchListUseCase getWatchListUseCase;

  @factoryMethod
  WatchListCubit({required this.getWatchListUseCase})
      : super(WatchListLoading(message: 'Loading....'));
  void initPage() async {
    emit(WatchListLoading(message: 'Loading....'));
    try {
      var watchList = await getWatchListUseCase.invoke();

      emit(WatchListSuccess(watchList: watchList));
    } catch (e) {
      emit(WatchListError(errorMessage: e.toString()));
    }
  }
}
