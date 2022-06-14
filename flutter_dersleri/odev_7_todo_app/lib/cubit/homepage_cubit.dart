import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev_7_todo_app/model/todo.dart';
import 'package:odev_7_todo_app/repo/todo_repository.dart';

class HomepageCubit extends Cubit<List<ToDo>> {
  HomepageCubit():super(<ToDo>[]);

  var td_repo = ToDoRepository();

  Future<void> loadTodos() async {
    var td_list = await td_repo.getAllTodos();
    emit(td_list);
  }

  Future<void> search(String word) async {
    var td_list = await td_repo.search(word);
    emit(td_list);
  }


  Future<void> delete(int yapilacak_id) async {
    await td_repo.delete(yapilacak_id);
    await loadTodos();
  }
}