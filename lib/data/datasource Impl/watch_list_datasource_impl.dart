import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_application/data/datasource%20contract/watch_list_datasource_contract.dart';
import 'package:movies_application/data/network/Firebase/firebase_manager.dart';
import 'package:movies_application/domain/entities/movie_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@Injectable(as: WatchListDatasourceContract)
class WatchListDatasourceImpl extends WatchListDatasourceContract {
  FirebaseManager firebaseManager = FirebaseManager();
  WatchListDatasourceImpl({required this.firebaseManager});

  @override
  // Future<List<MovieModel>?> getWatchListMovies() async {
  //   var response = await firebaseManager.getSavedMovies().first;
  //   return response.docs.map((e) => e.data().toMovieModel()).toList();
  // }
Stream<List<MovieModel>?> getWatchListMovies() {
  return firebaseManager.getSavedMovies().map((querySnapshot) {
    return querySnapshot.docs.map((doc) => doc.data().toMovieModel()).toList();
  });
}

  @override
  Future<void> addFavMovie(MovieModel movieModel) {
    return firebaseManager.addFavMovie(movieModel.toSaveModel());
  }

  @override
  Future<void> deleteFavMovie(MovieModel movieModel) {
    return firebaseManager.deleteFavMovie(movieModel.toSaveModel());
  }
}
// import 'package:firebase_core/firebase_core.dart';
// import 'package:injectable/injectable.dart';
// import 'package:movies_application/data/datasource%20contract/watch_list_datasource_contract.dart';
// import 'package:movies_application/data/network/Firebase/firebase_manager.dart';
// import 'package:movies_application/domain/entities/movie_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// @Injectable(as: WatchListDatasourceContract)
// class WatchListDatasourceImpl extends WatchListDatasourceContract {
//   FirebaseManager firebaseManager = FirebaseManager();

//   @override
//   Future<List<MovieModel>?> getWatchListMovies() async {
//     // ننتظر أول قيمة من الـ Stream
//     var response = await firebaseManager.getSavedMovies().first;

//     // التأكد من وجود بيانات قبل محاولة تحويلها
//     if (response.docs.isEmpty) {
//       return [];
//     }

//     // تحويل البيانات إلى قائمة MovieModel
//     return response.docs.map((e) {
//       var data = e.data() as Map<String, dynamic>;
//       return MovieModel.fromJson(data);
//     }).toList();
//   }
// }
