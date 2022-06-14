import 'package:odev_7_todo_app/model/todo.dart';
import 'package:odev_7_todo_app/sqlite/database_helper.dart';

class ToDoRepository {
  Future<void> addTodo(String yapilacak_ad) async {
    var db = await DatabaseHelper.accessDatabase();
    var infos = <String, dynamic>{};
    infos["yapilacak_ad"] = yapilacak_ad;

    await db.insert("yapilacaklar", infos);
  }

  Future<List<ToDo>> getAllTodos() async {
    var db = await DatabaseHelper.accessDatabase();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM yapilacaklar");

    return List.generate(maps.length, (index) {
      var line = maps[index];
      return ToDo(yapilacak_id: line["yapilacak_id"], yapilacak_ad: line["yapilacak_ad"]);
    });
  }

  Future<void> add(String yapilacak_ad) async {
    var db = await DatabaseHelper.accessDatabase();
    var yapilacak = <String, dynamic>{};
    yapilacak["yapilacak_ad"] = yapilacak_ad;
    await db.insert("yapilacaklar", yapilacak);
  }

  Future<void> update(int yapilacak_id, String yapilacak_ad) async {
    var db = await DatabaseHelper.accessDatabase();
    var yapilacak = <String, dynamic>{}; //Map
    yapilacak["yapilacak_id"] = yapilacak_id;
    yapilacak["yapilacak_ad"] = yapilacak_ad;
    await db.update("yapilacaklar", yapilacak, where: "yapilacak_id = ?", whereArgs: [yapilacak_id]);
  }

  Future<void> delete(int yapilacak_id) async {
    var db = await DatabaseHelper.accessDatabase();
    await db.delete("yapilacaklar", where: "yapilacak_id = ?", whereArgs: [yapilacak_id]);
  }

  Future<List<ToDo>> search(String word) async {
    var db = await DatabaseHelper.accessDatabase();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM yapilacaklar WHERE yapilacak_ad like '%$word%'");

    return List.generate(maps.length, (index) {
      var line = maps[index];
      return ToDo(yapilacak_id: line["yapilacak_id"], yapilacak_ad: line["yapilacak_ad"]);
    });
  }


}