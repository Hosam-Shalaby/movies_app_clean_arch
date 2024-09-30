import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_application/presentation/di/di.dart';
import 'package:movies_application/presentation/view%20model/cubit/home_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_application/presentation/view%20model/states/home_state.dart';
import 'package:movies_application/presentation/views/movie_details_screen.dart';
import 'package:movies_application/presentation/widgets/new_releases_widget.dart';
import 'package:movies_application/presentation/widgets/top_rated_widget.dart';
import 'package:movies_application/utls/constant/api_constant.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeCubit viewModel = getIt<HomeCubit>();
  @override
  void initState() {
    super.initState();
    viewModel.initPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case HomeLoading():
            {
              return const Center(child: CircularProgressIndicator());
            }
          case HomeError():
            {
              return Column(
                children: [
                  Text(state.errorMessage ?? ''),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Try Again'))
                ],
              );
            }
          case HomeSuccess():
            {
              var populars = state.popularList;
              var newReleases = state.newReleasesList;
              var topRated = state.topRatedList;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.h),
                    CarouselSlider.builder(
                      itemCount: populars?.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, MovieDetailsScreen.routeName,
                              arguments: populars[itemIndex]);
                        },
                        child: SizedBox(
                          height: 300.h,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        '${ApiConstant.imageBaseURL}${populars![itemIndex].posterPath}',
                                      )),
                                ),
                                child: Center(
                                  child: Image.asset(
                                      'assets/images/play-button-2.png'),
                                )),
                          ),
                        ),
                      ),
                      options: CarouselOptions(
                          autoPlay: true, animateToClosest: true),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'New Releases',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        height: 200.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newReleases?.length,
                          itemBuilder: (context, index) {
                            return NewReleasesWidget(
                              movieModel: newReleases![index],
                            );
                          },
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Top Rated',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        height: 250.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: topRated?.length,
                          itemBuilder: (context, index) {
                            return TopRatedWidget(
                              movieModel: topRated![index],
                            );
                          },
                        )),
                  ],
                ),
              );
            }
        }
      },
    );
  }
}
