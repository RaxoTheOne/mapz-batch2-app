import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dataset.dart';

class DatabaseHelper {
  static const _databaseName = "MeineDatenbank.db";
  static const _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

// Erstellen der Tabellenstruktur
  Future _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE meine_tabelle (
  id INTEGER PRIMARY KEY,
  spalte1 TEXT NOT NULL, 
  spalte2 INTEGER NOT NULL
)
''');
  }

// Einfügen von Datensätzen
  Future<int> insert(MeinDatensatz datensatz) async {
    Database db = await database;
    return await db.insert('meine_tabelle', datensatz.toMap());
  }

  //Abfragen aller Datensätze
  Future<List<MeinDatensatz>> querryAllRows() async {
    Database db = await database;
    List<Map> maps = await db.query('meine_tabelle');
    return List.generate(maps.length, (i) {
      return MeinDatensatz.fromMap(maps[i] as Map<String, dynamic>);
    });
  }

  // Funktion, um alle Datensätze in der Tabelle zu löschen
  Future<void> deleteAllRows() async {
    Database db = await database;
    await db.delete('meine_tabelle');
  }
}
