import 'dart:async';
import 'dart:io';

import 'package:jai_kisan/models/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class UserDataBaseHelper {
  static const _dbName = "UserDatabase.db";
  static const _dbVersion = 1;
  static const _tableName = "UserData";

  UserDataBaseHelper._privateConstructor();

  static final UserDataBaseHelper instance =
  UserDataBaseHelper._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) {
    return db.execute('''
    CREATE TABLE $_tableName(id INTEGER PRIMARY KEY,name TEXT,phoneNumber TEXT,preferredLanguage TEXT)
    ''');
  }

  Future<int> insert(UserModel user) async {
    Database? db = await instance.database;
    return await db!.insert(_tableName, user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<UserModel>> queryAll() async {
    Database? db = await instance.database;
    List<Map<String, dynamic>> maps = await db!.query(_tableName);

    return List.generate(maps.length, (index) {
      return UserModel(
          name: maps[index]["name"],
          phoneNumber: maps[index]["phoneNumber"],
          preferredLanguage: maps[index]["preferredLanguage"]);
    });
  }

  Future<UserModel> queryOne(int id) async {
    Database? db = await instance.database;
    List<Map<String, dynamic>> maps = await db!.query(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );

    return UserModel(
        name: maps.first["name"],
        phoneNumber: maps.first["phoneNumber"],
        preferredLanguage: maps.first["preferredLanguage"]);
  }

  Future<void> delete(String phoneNumber) async {
    Database? db = await instance.database;
    await db!.delete(
      _tableName,
      where: "phoneNumber = ?",
      whereArgs: [phoneNumber],
    );
  }

  Future<void> clear()async{
    Database? db = await instance.database;
    await db!.delete(_tableName);


  }

  /*Future<void> deleteDatabase() async {
    Database db = await instance.database;
    await db.delete(_tableName,);
  }*/

  Future<int> updateOption(UserModel newData) async {
    Database? db = await instance.database;
    var result = await db!.update(
      _tableName,
      newData.toMap(),
      where: "phoneNumber = ?",
      whereArgs: [newData.phoneNumber],
    );
    return result;
  }
}
