import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_application/domain/entities/genre_model.dart';

class BrowseWidget extends StatelessWidget {
  BrowseWidget({super.key, required this.genreModel});
  GenreModel genreModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/bc.png'))),
        height: 150.h,
        width: 90.w,
        child: Center(
          child: Text(genreModel.name,
              style:  TextStyle(color: Colors.white, fontSize: 25.sp)),
        ),
      ),
    );
  }
}
