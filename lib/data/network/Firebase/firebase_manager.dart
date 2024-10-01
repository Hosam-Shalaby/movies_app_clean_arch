import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_application/data/models/firebase%20models/save_model.dart';

@injectable
@singleton
class FirebaseManager {
  CollectionReference<SaveModel> getMoviesCollection() {
    return FirebaseFirestore.instance
        .collection('watchlist')
        .withConverter<SaveModel>(
            fromFirestore: (snapshot, options) =>
                SaveModel.fromFireStore(snapshot.data()!),
            toFirestore: (SaveModel saveModel, _) => saveModel.toFireStore());
  }

 // get movies
  Stream<QuerySnapshot<SaveModel>> getSavedMovies() {
    var collectionRef = getMoviesCollection();
    return collectionRef.snapshots();
  }

  
//  add movie
  Future<void> addFavMovie(SaveModel saveModel)  {
    var collectionRef = getMoviesCollection();
    return collectionRef.doc(saveModel.id.toString()).set(saveModel);
  }


  // delete movie
  Future<void> deleteFavMovie(SaveModel saveModel)  {
    var collectionRef = getMoviesCollection();
    return collectionRef.doc(saveModel.id.toString()).delete();
  }

 

  // // delete all movies
  // Future<void> deleteAllMovies()  {
  //   var collectionRef = getMoviesCollection();
  //   return collectionRef.get().then((value) {
  //     for (DocumentSnapshot doc in value.docs) {
  //       doc.reference.delete();
  //     }
  //   });
  // }


}
