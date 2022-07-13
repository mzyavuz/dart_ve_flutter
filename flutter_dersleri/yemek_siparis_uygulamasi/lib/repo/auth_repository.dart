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
        throw Exception("Lütfen tüm alanları doldurun.");
      }

      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'user-not-found':
          throw Exception("Kullanıcı bulunamadı.");
        case 'wrong-password':
          throw Exception("Hatalı şifre girdiniz.");
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
        throw Exception("Lütfen tüm alanları doldurun.");
      }

      if (password.length < 6) {
        throw Exception('Lütfen en az 7 karakterli bir şifre giriniz.');
      }

      var userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
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
              'Bu e-posta ile kayıtlı bir kullanıcı zaten var.');
        default:
          throw Exception(
              'Bir hata oluştu. Lütfen daha sonra tekrar deneyin.');
      }
    }
  }

  signOut() {
    _firebaseAuth.signOut();
  }
}