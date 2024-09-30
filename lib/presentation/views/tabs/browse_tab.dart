import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_application/presentation/di/di.dart';
import 'package:movies_application/presentation/view%20model/cubit/categories_cubit.dart';
import 'package:movies_application/presentation/view%20model/states/categories_state.dart';
import 'package:movies_application/presentation/widgets/browse_widget.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  CategoriesCubit viewModel = getIt<CategoriesCubit>();

  @override
  void initState() {
    super.initState();
    viewModel.initPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case CategoriesLoading():
            {
              return const Center(child: CircularProgressIndicator());
            }
          case CategoriesError():
            {
              return Column(
                children: [
                  Text(state.message ?? ''),
                  ElevatedButton(
                      onPressed: () {
                        print(state.message);
                      },
                      child: const Text('Try Again'))
                ],
              );
            }
          case CategoriesSuccess():
            {
              var categories = state.categories;
              return Column(
                children: [
                  const Text('Browse Category'),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) => BrowseWidget(
                        genreModel: categories![index],
                      ),
                      itemCount: categories?.length,
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
