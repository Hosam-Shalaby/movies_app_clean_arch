import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
import 'package:movies_application/presentation/view%20model/cubit/watch_list_cubit.dart';
import 'package:movies_application/utls/constant/api_constant.dart';

class WatchListWidget extends StatefulWidget {
  const WatchListWidget(
      {super.key, required this.movieModel, required this.watchListCubit});
  final MovieModel movieModel;
  final WatchListCubit watchListCubit;

  @override
  State<WatchListWidget> createState() => _WatchListWidgetState();
}

class _WatchListWidgetState extends State<WatchListWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected; // تغيير حالة التحديد
          if (selected) {
            // إضافة الفيلم إلى قائمة المراقبة عند تحديده
            widget.watchListCubit.addFavMovie(widget.movieModel);
          } else {
            // إزالة الفيلم من قائمة المراقبة عند إلغاء تحديده
            widget.watchListCubit.deleteFavMovie(widget.movieModel);
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox(
          height: 150.h,
          // width: 200,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      height: 250.h,
                      width: 150.w,
                      child: Image.network(
                        '${ApiConstant.imageBaseURL}${widget.movieModel.posterPath}',
                        fit: BoxFit.fill,
                      )),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${widget.movieModel.title}',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        ),
                        Text(
                          '${widget.movieModel.releaseDate}',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        ),
                        Text(
                          '${widget.movieModel.overview}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 25.h,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: !selected
                        ? Image.asset('assets/images/Icon awesome-bookmark.png')
                        : Image.asset('assets/images/Icon-bookmark.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
