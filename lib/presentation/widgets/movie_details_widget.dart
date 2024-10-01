// import 'package:flutter/material.dart';
// import 'package:movies_application/config/di/di.dart';
// import 'package:movies_application/domain/entities/movie_model.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:movies_application/presentation/view%20model/cubit/movie_details_cubit.dart';
// import 'package:movies_application/presentation/view%20model/cubit/watch_list_cubit.dart';

// class MovieDetailsWidget extends StatefulWidget {
//   final MovieModel movieModel;

//   final WatchListCubit watchListCubit;

//   const MovieDetailsWidget(
//       {super.key, required this.movieModel, required this.watchListCubit});

//   @override
//   State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
// }

// class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
//   MovieDetailsCubit viewModel = getIt<MovieDetailsCubit>();

//   bool selected = false;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GestureDetector(
//         onTap: () {
//           setState(() {
//             selected = !selected; // تغيير حالة التحديد
//             if (selected) {
//               // إضافة الفيلم إلى قائمة المراقبة عند تحديده
//               widget.watchListCubit.addFavMovie(widget.movieModel);
//             } else {
//               // إزالة الفيلم من قائمة المراقبة عند إلغاء تحديده
//               widget.watchListCubit.deleteFavMovie(widget.movieModel);
//             }
//           });
//         },
//         child: Stack(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 150.h,
//                   width: 100.w,
//                   child: Image.network(
//                     'https://image.tmdb.org/t/p/w500${widget.movieModel.posterPath}',
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Icon(Icons.star, color: Colors.amber, size: 15.sp),
//                     SizedBox(width: 10.w),
//                     Text(
//                       '${widget.movieModel.voteAverage}',
//                       style: TextStyle(color: Colors.white, fontSize: 12.sp),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       '${widget.movieModel.title}',
//                       style: TextStyle(color: Colors.white, fontSize: 8.sp),
//                     )
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       '${widget.movieModel.releaseDate}',
//                       style: TextStyle(color: Colors.white, fontSize: 8.sp),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 25.h,
//               child: Align(
//                 alignment: Alignment.topLeft,
//                 child: selected == true
//                     ? Image.asset('assets/images/Icon awesome-bookmark.png')
//                     : Image.asset('assets/images/Icon-bookmark.png'),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(3.5),
//               child: SizedBox(
//                 height: 10.h,
//                 child: Align(
//                     alignment: Alignment.topLeft,
//                     child: selected == true
//                         ? Image.asset('assets/images/Icon awesome-check.png')
//                         : Image.asset('assets/images/Icon ionic-ios-add.png')),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
