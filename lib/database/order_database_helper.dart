import 'dart:async';
import 'dart:io';

import 'package:jai_kisan/models/order.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class OrderDataBaseHelper {
  static const _dbName = "OrderDatabase.db";
  static const _dbVersion = 1;
  static const _tableName = "OrderData";

  OrderDataBaseHelper._privateConstructor();

  static final OrderDataBaseHelper instance =
  OrderDataBaseHelper._privateConstructor();

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
    CREATE TABLE $_tableName(id INTEGER PRIMARY KEY,phoneNumber TEXT,itemId INTEGER,price INTEGER,quantity INTEGER,address TEXT)
    ''');
  }

  Future<int> insert(Order order) async {
    Database? db = await instance.database;
    return await db!.insert(_tableName, order.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Order>> queryAll() async {
    Database? db = await instance.database;
    List<Map<String, dynamic>> maps = await db!.query(_tableName);

    return List.generate(maps.length, (index) {
      return Order(
          phoneNumber: maps[index]["phoneNumber"],
          itemId: maps[index]["itemId"],
          quantity: maps[index]["quantity"],
          price: maps[index]["price"],
          address: maps[index]["address"]);
    });
  }

  Future<Order> queryOne(int id) async {
    Database? db = await instance.database;
    List<Map<String, dynamic>> maps = await db!.query(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );

    return Order(
      phoneNumber: maps.first["phoneNumber"],
      itemId: maps.first["itemId"],
      quantity: maps.first["quantity"],
      price: maps.first["price"],
      address: maps.first["address"]);
  }

  Future<void> delete(String phoneNumber,int itemId) async {
    Database? db = await instance.database;
    await db!.delete(
      _tableName,
      where: "phoneNumber = ? and itemId = ?",
      whereArgs: [phoneNumber,itemId],
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

  Future<int> updateOption(Order newData) async {
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
