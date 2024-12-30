import 'package:ecoomerce_shop/core/constant/strings.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  // Private constructor for Singleton
  DBHelper._();
  static final DBHelper _instance = DBHelper._();

  // Singleton accessor
  static DBHelper get instance => _instance;

  // Database instance
  static Database? _database;

  /// Opens the database connection
  Future<Database> openDatabaseConnection() async {
    if (_database == null || !_database!.isOpen) {
      final path = await getDatabasesPath();
      final databasePath = '$path/${Strings.databaseName}';
      _database = await openDatabase(
        databasePath,
        version: Strings.databaseVersion,
        onCreate: _onCreate,
      );
    }
    return _database!;
  }

  /// Closes the database connection
  Future<void> closeDatabaseConnection() async {
    if (_database != null && _database!.isOpen) {
      await _database!.close();
      _database = null;
    }
  }

  /// Callback to initialize tables during database creation
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE wishlist (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        productId TEXT NOT NULL,
        productName TEXT NOT NULL,
        productPrice REAL NOT NULL,
        productImage TEXT NOT NULL
      );
    ''');
  }
}
