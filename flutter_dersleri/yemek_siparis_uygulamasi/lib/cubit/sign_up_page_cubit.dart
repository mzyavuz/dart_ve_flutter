import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_siparis_uygulamasi/model/user.dart';
import 'package:yemek_siparis_uygulamasi/repo/auth_repository.dart';

class SignUpPageCubit extends Cubit<void> {
  TheUser? theUser;

  SignUpPageCubit() :super(0);

  var authRepo = AuthRepository();

  signUp({
    required String username,
    required String name,
    required String surname,
    required String email,
    required String password,
  }) async {
    try {
      await authRepo.signUp(
          username: username,
          name: name,
          surname: surname,
          email: email,
          password: password
      );
    } catch(e) {
      print(e);
    }
    }

}