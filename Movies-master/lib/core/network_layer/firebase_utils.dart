import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/movie_model.dart';
import '../constants.dart';

class FirestoreUtils {
  static CollectionReference<MovieModel> getCollection() {
    return FirebaseFirestore.instance
        .collection('wishlist')
        .withConverter<MovieModel>(
          fromFirestore: (snapshot, _) =>
              MovieModel.fromFirestore(snapshot.data()!),
          toFirestore: (movie, _) => movie.toFirestore(),
        );
  }

  static Future<void> addDataToFirestore(MovieModel movie) {
    Constants.getFavoriteMovies();

    var collectionRef = getCollection();
    return collectionRef.doc(movie.id.toString()).set(movie);
  }

  static Future<void> deleteDataFromFirestore(int movieId) {
    Constants.getFavoriteMovies();

    var collectionRef = getCollection();
    var docRef = collectionRef.doc(movieId.toString());
    return docRef.delete();
  }

  static Future<List<MovieModel>> getDataFromFirestore() async {
    var snapshot = await getCollection().get();
    return snapshot.docs.map((element) => element.data()).toList();
  }

  static Stream<QuerySnapshot<MovieModel>> getRealTimeDataFromFirestore() {
    var snapshot = getCollection().snapshots();
    return snapshot;
  }
}
