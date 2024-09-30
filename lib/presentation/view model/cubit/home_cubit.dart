import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_application/domain/use%20cases/get_new_releases_use_case.dart';
import 'package:movies_application/domain/use%20cases/get_top_rated_use_case.dart';

import '../../../domain/use cases/get_populars_usecase.dart';
import '../states/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  GetPopularsUseCase getPopularsUseCase;
  GetNewReleasesUseCase getNewReleasesUseCase;
  GetTopRatedUseCase getTopRatedUseCase;
  @factoryMethod
  HomeCubit(
      {required this.getPopularsUseCase,
      required this.getNewReleasesUseCase,
      required this.getTopRatedUseCase})
      : super(HomeLoading(message: 'Loading....'));
  void initPage() async {
    emit(HomeLoading(message: 'Loading....'));
    try {
      var populars = await getPopularsUseCase.invoke();
      var newReleases = await getNewReleasesUseCase.invoke();
      var topRated = await getTopRatedUseCase.invoke();
      emit(HomeSuccess(
          popularList: populars,
          newReleasesList: newReleases,
          topRatedList: topRated));
    } catch (e) {
      emit(HomeError(errorMessage: e.toString()));
    }
  }
}
