import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev_7_todo_app/repo/todo_repository.dart';

class AddingPageCubit extends Cubit<void> {
  AddingPageCubit() : super(0);

  var td_repo = ToDoRepository();

  Future<void> add(String yapilacak_ad) async {
    await td_repo.add(yapilacak_ad);
  }
}
