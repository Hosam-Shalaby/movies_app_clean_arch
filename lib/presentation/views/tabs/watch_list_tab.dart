import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_application/config/di/di.dart';
import 'package:movies_application/presentation/view%20model/cubit/watch_list_cubit.dart';
import 'package:movies_application/presentation/view%20model/states/watch_list_state.dart';

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
    viewModel.initPage();
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
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Watch List',
                    style: TextStyle(color: Colors.white),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: watchList?.length,
                      itemBuilder: (context, index) {
                        return Text(watchList![index].title ?? '',
                            style: const TextStyle(color: Colors.white));
                      },
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
