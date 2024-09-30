import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_application/domain/use%20cases/categories_use_case.dart';
import 'package:movies_application/presentation/view%20model/states/categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesUseCase categoriesUseCase;
  @factoryMethod
  CategoriesCubit(this.categoriesUseCase)
      : super(CategoriesLoading(message: 'Loading....'));

  initPage() async {
    emit(CategoriesLoading(message: 'Loading.....'));
    try {
      var catrgories = await categoriesUseCase.invoke();
      emit(CategoriesSuccess(categories: catrgories));
    } catch (e) {
      emit(CategoriesError(message: e.toString()));
    }
  }
}
