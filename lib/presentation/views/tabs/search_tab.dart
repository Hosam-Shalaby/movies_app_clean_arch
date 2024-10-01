import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_application/config/di/di.dart';
import 'package:movies_application/presentation/view%20model/cubit/search_cubit.dart';
import 'package:movies_application/presentation/view%20model/states/search_state.dart';
import 'package:movies_application/presentation/views/movie_details_screen.dart';
import 'package:movies_application/presentation/widgets/search_widget.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key, this.movieName});
  final String? movieName;

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  SearchCubit viewModel = getIt<SearchCubit>();

  @override
  void initState() {
    viewModel.initPage(widget.movieName ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<SearchCubit, SearchsState>(
            bloc: viewModel,
            builder: (context, state) {
              switch (state) {
                case SearchLoading():
                  {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                case SearchError():
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
                case SearchSuccess():
                  {
                    var searchList = state.searchsList;
                    return ListView.builder(
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, MovieDetailsScreen.routeName,
                              arguments: searchList[index]);
                        },
                        child: SearchWidget(
                          movieModel: searchList![index],
                        ),
                      ),
                      itemCount: searchList?.length,
                    );
                  }
              }
            }));
  }
}
