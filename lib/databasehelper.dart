import 'dart:async';
import 'dart:core';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
// create a database
class Databasehelper{

static final _dbname = 'myDatabase9.db';

static final _dbVersion = 1;

Databasehelper._privateConstructor();

static final Databasehelper instance = Databasehelper._privateConstructor();

late Database _database;

String tabname="tabname";

Future<Database> get database async{

   _database = await _initiateDatabase();
   return _database;
}

_initiateDatabase () async{
Directory dir = await getApplicationDocumentsDirectory();
String path = dir.path+_dbname;
return await openDatabase(path,version: _dbVersion,onCreate: _oc);

}

FutureOr _oc(Database db,int version){
db.execute(
  '''
  CREATE TABLE $tabname(
    _id INT PRIMARY KEY,
    name TEXT NOT NULL,
    name2 TEXT
  )
  '''
);
}

Future<int> insert(Map<String,dynamic> row) async{
  Database db = await instance.database;
  return await db.insert(tabname, row);
}

Future<List<Map<String,dynamic>>> sel() async{
  Database db=await instance.database;
  return await db.query(tabname);
}

Future<int> del(int id) async{
  Database db=await instance.database;
  return db.delete(tabname,where: '_id = ?',whereArgs: [id]);
}
}
