// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/datasource%20contract/categories_datasource_contract.dart'
    as _i539;
import '../../data/datasource%20contract/movie_details_datasource_contract.dart'
    as _i803;
import '../../data/datasource%20contract/new_releases_datasource_contract.dart'
    as _i1058;
import '../../data/datasource%20contract/popular_datasource_contract.dart'
    as _i987;
import '../../data/datasource%20contract/search_datasource_contract.dart'
    as _i1055;
import '../../data/datasource%20contract/top_rated_datasource_contract.dart'
    as _i615;
import '../../data/datasource%20contract/watch_list_datasource_contract.dart'
    as _i160;
import '../../data/datasource%20Impl/categories_datasource_impl.dart' as _i769;
import '../../data/datasource%20Impl/movie_details_datasource_impl.dart'
    as _i521;
import '../../data/datasource%20Impl/new_releases_datasource_impl.dart'
    as _i241;
import '../../data/datasource%20Impl/popular_datasource_impl.dart' as _i640;
import '../../data/datasource%20Impl/search_datasource_impl.dart' as _i670;
import '../../data/datasource%20Impl/top_rated_datasource_impl.dart' as _i167;
import '../../data/datasource%20Impl/watch_list_datasource_impl.dart' as _i520;
import '../../data/network/Api/api_manager.dart' as _i616;
import '../../data/network/Firebase/firebase_manager.dart' as _i400;
import '../../data/repository%20Impl/categories_repository_impl.dart' as _i429;
import '../../data/repository%20Impl/movie_details_repository_impl.dart'
    as _i679;
import '../../data/repository%20Impl/new_releases_repository_impl.dart'
    as _i589;
import '../../data/repository%20Impl/popular_repository_impl.dart' as _i1011;
import '../../data/repository%20Impl/search_repository_impl.dart' as _i917;
import '../../data/repository%20Impl/top_rated_repository_impl.dart' as _i985;
import '../../data/repository%20Impl/watch_list_repository_impl.dart' as _i628;
import '../../domain/repository%20contract/categories_repository_contract.dart'
    as _i592;
import '../../domain/repository%20contract/movie_details_repository_contract.dart'
    as _i46;
import '../../domain/repository%20contract/new_releases_repository_contract.dart'
    as _i360;
import '../../domain/repository%20contract/popular_repository_contract.dart'
    as _i477;
import '../../domain/repository%20contract/search_repository_contract.dart'
    as _i540;
import '../../domain/repository%20contract/top_rated_repository_contract.dart'
    as _i1034;
import '../../domain/repository%20contract/watch_list_repository_contract.dart'
    as _i587;
import '../../domain/use%20cases/categories_use_case.dart' as _i291;
import '../../domain/use%20cases/get_movie_details_use_case.dart' as _i982;
import '../../domain/use%20cases/get_new_releases_use_case.dart' as _i401;
import '../../domain/use%20cases/get_populars_usecase.dart' as _i169;
import '../../domain/use%20cases/get_top_rated_use_case.dart' as _i151;
import '../../domain/use%20cases/search_use_case.dart' as _i625;
import '../../domain/use%20cases/watch_list_use_case.dart' as _i346;
import '../../presentation/view%20model/cubit/categories_cubit.dart' as _i964;
import '../../presentation/view%20model/cubit/home_cubit.dart' as _i874;
import '../../presentation/view%20model/cubit/movie_details_cubit.dart'
    as _i1002;
import '../../presentation/view%20model/cubit/search_cubit.dart' as _i386;
import '../../presentation/view%20model/cubit/watch_list_cubit.dart' as _i1018;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i400.FirebaseManager>(() => _i400.FirebaseManager());
    gh.singleton<_i616.ApiManager>(() => _i616.ApiManager());
    gh.factory<_i160.WatchListDatasourceContract>(() =>
        _i520.WatchListDatasourceImpl(
            firebaseManager: gh<_i400.FirebaseManager>()));
    gh.factory<_i1058.NewReleasesDatasourceContract>(() =>
        _i241.NewReleasesDatasourceImpl(apiManager: gh<_i616.ApiManager>()));
    gh.factory<_i1055.SearchDatasourceContract>(
        () => _i670.SearchDatasourceImpl(apiManager: gh<_i616.ApiManager>()));
    gh.factory<_i539.CategoriesDatasourceContract>(() =>
        _i769.CategoriesDatasourceImpl(apiManager: gh<_i616.ApiManager>()));
    gh.factory<_i803.MovieDetailsDatasourceContract>(() =>
        _i521.MovieDetailsDatasourceImpl(apiManager: gh<_i616.ApiManager>()));
    gh.factory<_i615.TopRatedDatasourceContract>(
        () => _i167.TopRatedDatasourceImpl(apiManager: gh<_i616.ApiManager>()));
    gh.factory<_i987.PopularDatasourceContract>(
        () => _i640.PopularDatasourceImpl(apiManager: gh<_i616.ApiManager>()));
    gh.factory<_i360.NewReleasesRepositoryContract>(() =>
        _i589.NewReleasesRepositoryImpl(
            newReleasesDatasourceContract:
                gh<_i1058.NewReleasesDatasourceContract>()));
    gh.factory<_i587.WatchListRepositoryContract>(() =>
        _i628.WatchListRepositoryImpl(
            watchListDatasourceContract:
                gh<_i160.WatchListDatasourceContract>()));
    gh.factory<_i540.SearchRepositoryContract>(() => _i917.SearchRepositoryImpl(
        searchDatasourceContract: gh<_i1055.SearchDatasourceContract>()));
    gh.factory<_i346.WatchListUseCase>(() => _i346.WatchListUseCase(
        watchListRepositoryContract: gh<_i587.WatchListRepositoryContract>()));
    gh.factory<_i46.MovieDetailsRepositoryContract>(() =>
        _i679.MovieDetailsRepositoryImpl(
            movieDetailsDatasourceContract:
                gh<_i803.MovieDetailsDatasourceContract>()));
    gh.factory<_i625.SearchUseCase>(() => _i625.SearchUseCase(
        searchRepositoryContract: gh<_i540.SearchRepositoryContract>()));
    gh.factory<_i1018.WatchListCubit>(() => _i1018.WatchListCubit(
        getWatchListUseCase: gh<_i346.WatchListUseCase>()));
    gh.factory<_i1034.TopRatedRepositoryContract>(() =>
        _i985.TopRatedRepositoryImpl(
            topRatedDatasourceContract:
                gh<_i615.TopRatedDatasourceContract>()));
    gh.factory<_i151.GetTopRatedUseCase>(() => _i151.GetTopRatedUseCase(
        topRatedRepositoryContract: gh<_i1034.TopRatedRepositoryContract>()));
    gh.factory<_i401.GetNewReleasesUseCase>(() => _i401.GetNewReleasesUseCase(
        newReleasesRepositoryContract:
            gh<_i360.NewReleasesRepositoryContract>()));
    gh.factory<_i592.CategoriesRepositoryContract>(() =>
        _i429.CategoriesRepositoryImpl(
            categoriesDatasourceContract:
                gh<_i539.CategoriesDatasourceContract>()));
    gh.factory<_i477.PopularRepositoryContract>(() =>
        _i1011.PopularRepositoryImpl(
            popularDatasourceContract: gh<_i987.PopularDatasourceContract>()));
    gh.factory<_i291.CategoriesUseCase>(() => _i291.CategoriesUseCase(
        categoriesRepositoryContract:
            gh<_i592.CategoriesRepositoryContract>()));
    gh.factory<_i982.GetMovieDetailsUseCase>(() => _i982.GetMovieDetailsUseCase(
        movieDetailsRepositoryContract:
            gh<_i46.MovieDetailsRepositoryContract>()));
    gh.factory<_i386.SearchCubit>(
        () => _i386.SearchCubit(searchUseCase: gh<_i625.SearchUseCase>()));
    gh.factory<_i964.CategoriesCubit>(
        () => _i964.CategoriesCubit(gh<_i291.CategoriesUseCase>()));
    gh.factory<_i169.GetPopularsUseCase>(() => _i169.GetPopularsUseCase(
        popularRepositoryContract: gh<_i477.PopularRepositoryContract>()));
    gh.factory<_i874.HomeCubit>(() => _i874.HomeCubit(
          getPopularsUseCase: gh<_i169.GetPopularsUseCase>(),
          getNewReleasesUseCase: gh<_i401.GetNewReleasesUseCase>(),
          getTopRatedUseCase: gh<_i151.GetTopRatedUseCase>(),
        ));
    gh.factory<_i1002.MovieDetailsCubit>(() => _i1002.MovieDetailsCubit(
        getMovieDetailsUseCase: gh<_i982.GetMovieDetailsUseCase>()));
    return this;
  }
}
