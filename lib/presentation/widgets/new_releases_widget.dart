import 'package:flutter/material.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewReleasesWidget extends StatefulWidget {
  MovieModel movieModel;

  NewReleasesWidget({super.key, required this.movieModel});

  @override
  State<NewReleasesWidget> createState() => _NewReleasesWidgetState();
}

class _NewReleasesWidgetState extends State<NewReleasesWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onDoubleTap: () {
          setState(() {});
          selected = true;
        },
        onTap: () {
          setState(() {});
          selected = false;
        },
        child: Stack(
          children: [
            SizedBox(
              height: 180.h,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${widget.movieModel.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 25.h,
              child: Align(
                alignment: Alignment.topLeft,
                child: selected == true
                    ? Image.asset('assets/images/Icon awesome-bookmark.png')
                    : Image.asset('assets/images/Icon-bookmark.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.5),
              child: SizedBox(
                height: 10.h,
                child: Align(
                    alignment: Alignment.topLeft,
                    child: selected == true
                        ? Image.asset('assets/images/Icon awesome-check.png')
                        : Image.asset('assets/images/Icon ionic-ios-add.png')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
