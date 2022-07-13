import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_siparis_uygulamasi/model/user.dart';
import 'package:yemek_siparis_uygulamasi/repo/auth_repository.dart';

class SignInPageCubit extends Cubit<List<TheUser>> {
  TheUser? theUser;
  SignInPageCubit():super(<TheUser>[]);

  var authRepo = AuthRepository();

  Future<void> signIn(String email, String password) async {
    try {
      await authRepo.signIn(email, password);
      theUser = await authRepo.getTheUser();
      emit([theUser!]);

    } catch (e) {
      print(e);
      emit([]);
    }
  }

  Future<void> signInAnonymously(String username) async {
    try {
      await authRepo.signInAnonymously(username).then(
            (value) => {
           theUser = TheUser(
               id: "",
               username: username,
               name: "", surname: "",
               email: "",
               anonymous: true
           )
        },
      );

      emit([theUser!]);
    } catch (error) {
      print(error);
      emit([]);
    }
  }
}