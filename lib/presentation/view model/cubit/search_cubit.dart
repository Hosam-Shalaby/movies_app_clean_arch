import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_application/domain/use%20cases/search_use_case.dart';
import 'package:movies_application/presentation/view%20model/states/search_state.dart';
@injectable
class SearchCubit extends Cubit<SearchsState> {
  SearchUseCase searchUseCase;
  @factoryMethod
  SearchCubit({required this.searchUseCase})
      : super(SearchLoading(message: 'Loading....'));

  void initPage(String movieName) async {
    emit(SearchLoading(message: 'Loading...'));
    try {
      var searchList = await searchUseCase.invoke(movieName);
      emit(SearchSuccess(searchsList: searchList));
    } catch (e) {
      emit(SearchError(errorMessage: e.toString()));
    }
  }
}
