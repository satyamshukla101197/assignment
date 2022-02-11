import 'package:sqflite/sqflite.dart';
import 'package:supdup/core/utils/constants.dart';

class DBProvider {
  static Database? _database;

  Future<Database?> getInstance() async {
    if (_database != null) return _database;
    _database = await _initDB();
    return _database;
  }

  /// Initializing the database
  _initDB() async {
    return await openDatabase(Constants.DB_NAME, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      // await db.execute("CREATE TABLE ${Constants.TABLE_USER} (");
    });
  }
}
