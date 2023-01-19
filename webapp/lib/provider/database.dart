import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:webapp/models/name_color.dart';

class Database {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; // Create an instance of Firebase Firestore.
  late CollectionReference
      _services; // this holds a refernece to the Movie collection in our firestore.

  Stream get services => _firestore
      .collection("services")
      .snapshots(); // a stream that is continuously listening for changes happening in the database

  // Add a Service
  // A method that will add a new Service m to our Service collection and return true if its successful.
  Future<bool> addNewMovie(NameIconColor m) async {
    _services =
        _firestore.collection('movies'); // referencing the movie collection .
    try {
      await _services.add({
        'title': m.title,
      }); // Adding a new document to our Service collection
      return true; // finally return true
    } catch (e) {
      return Future.error(e); // return error
    }
  }
  // // Remove a Movie
  // Future<bool> removeMovie(String movieId) async {
  //   _services = _firestore.collection('movies');
  //   try {
  //     await _services.doc(movieId).delete(); // deletes the document with id of movieId from our movies collection
  //     return true; // return true after successful deletion .
  //   } catch (e) {
  //     print(e.message);
  //     return Future.error(e); // return error
  //   }
  // }
// // Edit a Movie
//   Future<bool> editMovie(Movie m, String movieId) async {
//     _movies = _firestore.collection('movies');
//     try {
//       await _movies.doc(movieId).update(             // updates the movie document having id of moviedId
//           {'name': m.movieName, 'poster': m.posterURL, 'length': m.length});
//       return true; //// return true after successful updation .
//     } catch (e) {
//       print(e.message);
//       return Future.error(e); //return error
//     }
//   }
// }

// Creating a simple Riverpod provider that provides an instance of our Database class so that it can be used from our UI(by calling Database class methods)
  final databaseProvider = Provider((ref) => Database());
}
