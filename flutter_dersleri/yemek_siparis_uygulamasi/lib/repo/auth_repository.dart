import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yemek_siparis_uygulamasi/model/user.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<TheUser?> getTheUser() async {
    User? user = _firebaseAuth.currentUser;

    if (user == null) {
      return null;
    } else if (user.isAnonymous) {
      return TheUser(
        id: "",
        username: "",
        name: user.displayName!,
        surname: "",
        email: "",
        anonymous: true,
      );
    }

    var userDoc =
    await _firebaseFirestore.collection('users').doc(user.uid).get();

    return TheUser(
      id: user.uid,
      username: userDoc['username'],
      name: userDoc['name'],
      surname: userDoc['surname'],
      email: userDoc['email'],
      anonymous: false,
    );
  }

  signIn(String email, String password) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        throw Exception("Please fill the all areas.");
      }

      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'user-not-found':
          throw Exception("User not found!");
        case 'wrong-password':
          throw Exception("Wrong password!");
      }
    }
  }

  signInAnonymously(String username) async {
    await _firebaseAuth.signInAnonymously().then(
          (auth) => {
        auth.user!.updateDisplayName(username),
      },
    );
  }

  signUp({
    required String username,
    required String name,
    required String surname,
    required String email,
    required String password,
  }) async {
    try {
      if (username.isEmpty ||
          name.isEmpty ||
          surname.isEmpty ||
          email.isEmpty ||
          password.isEmpty) {
        throw Exception("Please fill the all areas.");
      }

      if (password.length < 6) {
        throw Exception('Please enter at least 7 characters.');
      }

      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String _userId = _firebaseAuth.currentUser!.uid;

      _firebaseFirestore.collection('users').doc(_userId).set(
          {'username': username, 'name': name, 'surname':surname, 'email': email,});
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'email-already-in-use':
          throw Exception(
              'This email already in use!');
        default:
          throw Exception(
              'Error occured. Please try again later!');
      }
    }
  }

  signOut() {
    _firebaseAuth.signOut();
  }
}