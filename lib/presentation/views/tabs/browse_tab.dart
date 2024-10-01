import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_application/config/di/di.dart';
import 'package:movies_application/presentation/view%20model/cubit/categories_cubit.dart';
import 'package:movies_application/presentation/view%20model/states/categories_state.dart';
import 'package:movies_application/presentation/widgets/browse_widget.dart';
import 'package:movies_application/utls/constant/color_constant.dart';

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
              return Scaffold(
                backgroundColor: ColorConstant.backGroundColor,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     SizedBox(height: 30.h),
                     Text('Browse Category',
                        style: TextStyle(fontSize: 20.sp, color: Colors.white)),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) =>
                            BrowseWidget(genreModel: categories![index]),
                        itemCount: categories?.length,
                      ),
                    ),
                  ],
                ),
              );
            }
        }
      },
    );
  }
}
