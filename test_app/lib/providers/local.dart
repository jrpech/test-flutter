import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_app/providers/payloads/profile_response.dart';

class LocalProvider {
  static const _DB_NAME = 'test_flutter.db';
  static const _TABLE = 'user';
  static const _VERSION = 1;

  Database _db;

  Future<void> _createTable(Database db) async {
    await db.execute(
      "CREATE TABLE " +
          _TABLE +
          " ("
              "id TEXT KEY, "
              "email TEXT, "
              "first_name TEXT, "
              "last_name TEXT, "
              "phone_number TEXT, "
              "profile_picture TEXT, "
              "card_number TEXT "
              ")",
    );
  }

  get database async {
    if (this._db == null) {
      this._db = await openDatabase(
        join(await getDatabasesPath(), _DB_NAME),
        onCreate: (db, version) {
          return this._createTable(db);
        },
        version: _VERSION,
      );
    }
    //print(_db.path);
    return this._db;
  }

  Future<ProfileResponse> existUser() async {
    final db = await this.database;
    final maps = await db.query(_TABLE, limit: 1);

    if (maps.isEmpty) {
      return null;
    } else {
      return ProfileResponse(
          email: maps[0]['email'],
          firstName: maps[0]['first_name'],
          lastName: maps[0]['last_name'],
          phoneNumber: maps[0]['phone_number'],
          profilePicture: maps[0]['profile_picture'],
          cardNumber: maps[0]['card_number']);
    }
  }

  void deleteUser() async {
    final db = await this.database;
    await db.delete(_TABLE);
  }

  Future<int> saveUser(ProfileResponse user) async {
    final Database db = await database;
    deleteUser();
    final userMap = user.toJson();
    userMap['id'] = user.email;

    return db.insert(
      _TABLE,
      userMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
