import 'dart:async';
import 'dart:core';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

// create a database
class Databasehelper {
  static final _dbname = 'myDatabase9.db';

  static final _dbVersion = 1;

  Databasehelper._privateConstructor();

  static final Databasehelper instance = Databasehelper._privateConstructor();

  late Database _database;

  String tabname = "tabname";

  Future<Database> get database async {
    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + _dbname;
    return await openDatabase(path, version: _dbVersion, onCreate: _oc);
  }

  FutureOr _oc(Database db, int version) {
    db.execute('''
  CREATE TABLE user(
    email TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    password TEXT NOT NULL,
    confirm TEXT NOT NULL,
  )
  ''');
    db.execute('''
  CREATE TABLE Train(
    tno INT PRIMARY KEY,
    from TEXT NOT NULL,
    to TEXT NOT NULL,
    date TEXT NOT NULL,
  )
  ''');
    db.execute('''
  CREATE TABLE Ticket(
    pnr INT PRIMARY KEY,
    tno int not null,
    from TEXT NOT NULL,
    to TEXT NOT NULL,
    date TEXT NOT NULL,
  )
  ''');
    db.execute('''
  CREATE TABLE route(
    tno INT PRIMARY KEY,
    from TEXT NOT NULL,
    to TEXT NOT NULL,
    s1 TEXT NOT NULL,
    s2 TEXT NOT NULL,
    s3 TEXT NOT NULL,
    s4 TEXT NOT NULL,
  )
  ''');
    db.execute('''
  CREATE TABLE Seat(
    tno INT PRIMARY KEY,
    sno INT NOT NULL,
  )
  ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tabname, row);
  }

  Future<List<Map<String, dynamic>>> sel() async {
    Database db = await instance.database;
    return await db.query(tabname);
  }

  Future<int> del(int id) async {
    Database db = await instance.database;
    return db.delete(tabname, where: '_id = ?', whereArgs: [id]);
  }
}
