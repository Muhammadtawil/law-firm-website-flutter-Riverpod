
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:riverpod_demo_firebase/models/Movie.dart';

// class Database {
//   FirebaseFirestore _firestore = FirebaseFirestore.instance; // Create an instance of Firebase Firestore.
//   CollectionReference _movies; // this holds a refernece to the Movie collection in our firestore.

//   Stream get allMovies => _firestore.collection("movies").snapshots(); // a stream that is continuously listening for changes happening in the database

//   // Add a Movie
//   // A method that will add a new Movie m to our Movies collection and return true if its successful.
//   Future<bool> addNewMovie(Movie m) async {
//     _movies = _firestore.collection('movies'); // referencing the movie collection .
//     try {
//       await _movies.add(
//           {'name': m.movieName, 'poster': m.posterURL, 'length': m.length}); // Adding a new document to our movies collection
//       return true; // finally return true 
//     } catch (e) {
//       return Future.error(e); // return error 
//     }
//   }
//   // Remove a Movie
//   Future<bool> removeMovie(String movieId) async {
//     _movies = _firestore.collection('movies');
//     try {
//       await _movies.doc(movieId).delete(); // deletes the document with id of movieId from our movies collection
//       return true; // return true after successful deletion .
//     } catch (e) {
//       print(e.message);
//       return Future.error(e); // return error 
//     }
//   }
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

// // Creating a simple Riverpod provider that provides an instance of our Database class so that it can be used from our UI(by calling Database class methods)
// final databaseProvider = Provider((ref) => Database());