
import 'dart:io';

import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  static final String databaseName = "todo.sqlite";

  static Future<Database> accessDatabase() async {
    String databasePath = join(await getDatabasesPath(), databaseName);

    if (await databaseExists(databasePath)) {
      print("Database has already exist. No need to copy");
    } else {
      ByteData data = await rootBundle.load("veritabani/$databaseName");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(databasePath).writeAsBytes(bytes, flush: true);
      print("Database has been copied");
    }

    return openDatabase(databasePath);
  }
}