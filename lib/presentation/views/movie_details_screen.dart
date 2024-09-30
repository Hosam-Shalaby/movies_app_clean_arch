import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
import 'package:movies_application/presentation/di/di.dart';
import 'package:movies_application/presentation/view%20model/cubit/home_cubit.dart';
import 'package:movies_application/presentation/view%20model/states/home_state.dart';
import 'package:movies_application/presentation/widgets/new_releases_widget.dart';
import 'package:movies_application/presentation/widgets/top_rated_widget.dart';
import 'package:movies_application/utls/constant/color_constant.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});
  static const String routeName = 'MovieDetailsScreen';
  // final int? movieId;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  HomeCubit viewModel = getIt<HomeCubit>();
  // MovieDetailsCubit viewModel = getIt<MovieDetailsCubit>();

  @override
  void initState() {
    viewModel.initPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as MovieModel;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
        title: Text(
          '${model.title}',
          style: TextStyle(fontSize: 20.sp, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500${model.posterPath}"),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Image.asset("assets/images/play-button-2.png"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                '${model.title}',
                style: TextStyle(fontSize: 20.sp, color: Colors.white),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  '${model.releaseDate}',
                  style: TextStyle(fontSize: 20.sp, color: Colors.white),
                )),
            Row(
              children: [
                NewReleasesWidget(movieModel: model),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '${model.overview}',
                        maxLines: 4,
                        overflow: TextOverflow.visible,
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 25.sp),
                          SizedBox(width: 10.w),
                          Text(
                            '${model.voteAverage}',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration:
                  const BoxDecoration(color: ColorConstant.backGroundColor),
              height: 245.h,
              width: 455.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'More Like this',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp),
                    ),
                  ),
                  SizedBox(
                      height: 210.h,
                      child: BlocBuilder<HomeCubit, HomeState>(
                          bloc: viewModel,
                          builder: (context, state) {
                            switch (state) {
                              // case MovieDetailsLoading():
                              case HomeLoading():
                                {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              // case MovieDetailsError():
                              case HomeError():
                                {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        state.errorMessage ?? '',
                                        style: TextStyle(fontSize: 35.sp),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            print(state.errorMessage);
                                          },
                                          child: const Text('try Again'))
                                    ],
                                  );
                                }
                              // case MovieDetailsSuccess():
                              case HomeSuccess():
                                {
                                  // var moviesList = state.movieDetailsList;
                                  var moviesList = state.popularList;

                                  return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: moviesList?.length,
                                      itemBuilder: (context, index) =>
                                          TopRatedWidget(
                                            movieModel: moviesList![index],
                                          ));
                                }
                            }
                          })),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
