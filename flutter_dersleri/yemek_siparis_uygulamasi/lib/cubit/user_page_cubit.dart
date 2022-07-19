import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_siparis_uygulamasi/model/user.dart';
import 'package:yemek_siparis_uygulamasi/repo/auth_repository.dart';

class UserPageCubit extends Cubit<List<TheUser>> {
  TheUser? theUser;

  UserPageCubit() : super(<TheUser>[]);

  var authRepo = AuthRepository();

  Future<void> loadTheUser() async {
    var userList = <TheUser>[];
    theUser = await authRepo.getTheUser();
    if (theUser != null) {
      userList.add(theUser!);
    }
      emit(userList);
    }
}
