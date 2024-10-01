import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_application/domain/entities/genre_model.dart';

class BrowseWidget extends StatelessWidget {
  BrowseWidget({super.key, required this.genreModel});
  GenreModel genreModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Rectangle 1.png'),
              fit: BoxFit.cover)),
      child: Center(
        child: Text(genreModel.name,
            style: TextStyle(color: Colors.white, fontSize: 25.sp)),
      ),
    );
  }
}
