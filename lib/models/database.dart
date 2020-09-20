import 'dart:io';

import 'package:nitesh/models/homeexpense.dart';
import 'package:nitesh/widgets/singlechildscrollview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databasename = "HomeExpense.db";
  static final _databaseversion = 1;
  static final table = "mytable";
  static final coloumnId = "id";
  static final coloumntitle = "name";
  static final coloumndate = "date";
  static final electricityprevunit = "epunit";
  static final electricitycurrunit = "ecunit";
  static final waterunit = "wunit";
  static final puranovada = "puranovada";
  static final newvada = "newvada";
  static final wifiprice = "wifiprice";
  static final roomnum = "roomnum";
  static Database _database;
  //this is a database variable
  DatabaseHelper._privateconstructor();
  static final DatabaseHelper instance = DatabaseHelper
      ._privateconstructor(); //this saves from crashes it makes only one object

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initializeDatabase();
    return _database;
  }

  _initializeDatabase() async {
    //create directory and join path with database name
    Directory documentdirectory = await getApplicationDocumentsDirectory();
    String path = join(documentdirectory.path, _databasename);
    return await openDatabase(path,
        version: _databaseversion, onCreate: _createdatabase);
  }

  Future _createdatabase(Database db, int version) async {
    await db.execute('''
                CREATE TABLE $table(
                $coloumnId INTEGER PRIMARY KEY,
                $coloumntitle TEXT,
                $coloumndate TEXT,
                $electricityprevunit TEXT,
                $electricitycurrunit TEXT,
                $puranovada TEXT,
                $newvada TEXT,
                $waterunit TEXT,
                $wifiprice TEXT,
                $roomnum TEXT
                );
                '''); //dont insert , on last
  }

  //function to insert a data iin database
  Future<int> insert(Homeexp homeexp) async {
    Database db = await instance.database;
    return db.insert(
      table,
      homeexp.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  } //row is a local variable

  Future<List<Map<String, dynamic>>> queryall() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> queryspecific(int age) async {
    Database db = await instance.database;
    var res = await db.query(table, where: "age > ?", whereArgs: [age]);

    return res;
  }

  Future<int> deletedata() async {
    Database db = await instance.database;
    //int res = await db.delete(table, where: "id =?", whereArgs: [id]);
    var res = db.delete(table);
    return res;
  }

  /* Future<int> update(int id) async {
    Database db = await instance.database;
    var res = await db.update(table, {"name": "Ram", "age": 88},
        where: "id =?", whereArgs: [id]);
    return res;
  }
  */
}
