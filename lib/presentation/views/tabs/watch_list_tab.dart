import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_application/config/di/di.dart';
import 'package:movies_application/config/theme/theme_data.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
import 'package:movies_application/presentation/view%20model/cubit/watch_list_cubit.dart';
import 'package:movies_application/presentation/view%20model/states/watch_list_state.dart';
import 'package:movies_application/presentation/widgets/watch_list_widget.dart';

class WatchListTab extends StatefulWidget {
  const WatchListTab({super.key});

  @override
  State<WatchListTab> createState() => _WatchListTabState();
}

class _WatchListTabState extends State<WatchListTab> {
  WatchListCubit viewModel = getIt<WatchListCubit>();

  @override
  void initState() {
    super.initState();
    viewModel.getWatchListMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListCubit, WatchListState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case WatchListLoading():
            {
              return const Center(child: CircularProgressIndicator());
            }
          case WatchListError():
            {
              return Column(
                children: [
                  Text(state.errorMessage ?? ''),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getWatchListMovies();

                        print(state.errorMessage);
                      },
                      child: const Text('Try Again'))
                ],
              );
            }
          case WatchListSuccess():
            {
              var watchList = state.watchList;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Watch List',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: .5,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: watchList!.length,
                      itemBuilder: (context, index) {
                        return WatchListWidget(
                          movieModel: watchList[index],
                          watchListCubit: viewModel,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                        color: Colors.white,
                        thickness: .5,
                      ),
                    ),
                  ),
                ],
              );
            }
        }
      },
    );
  }
}
