import 'package:flutter/material.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
import 'package:movies_application/utls/constant/api_constant.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({super.key, required this.movieModel});
  MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      // width: 200,
      child: Row(
        children: [
          SizedBox(
              height: 200,
              width: 200,
              child: Image.network(
                  '${ApiConstant.imageBaseURL}${movieModel.posterPath}')),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${movieModel.title}',
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
                Text(
                  '${movieModel.releaseDate}',
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
                Text(
                  '${movieModel.overview}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
