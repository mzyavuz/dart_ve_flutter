import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev_7_todo_app/repo/todo_repository.dart';

class DetailPageCubit extends Cubit<void> {
  DetailPageCubit() : super(0);

  var td_repo = ToDoRepository();

  Future<void> update(int yapilacak_id, String yapilacak_ad) async {
    await td_repo.update(yapilacak_id,yapilacak_ad);
  }
}
