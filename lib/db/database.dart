import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/transaksi.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'tokobalance.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE transaksi(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            kategori TEXT,
            nominal REAL,
            keterangan TEXT,
            tanggal TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertTransaksi(Transaksi transaksi) async {
    final db = await database;
    return await db.insert('transaksi', transaksi.toMap());
  }

  Future<List<Transaksi>> getTransaksi() async {
    final db = await database;
    final result = await db.query('transaksi');
    return result.map((e) => Transaksi(
      id: e['id'] as int?,
      kategori: e['kategori'] as String,
      nominal: e['nominal'] as double,
      keterangan: e['keterangan'] as String,
      tanggal: e['tanggal'] as String,
    )).toList();
  }

  Future<void> deleteTransaksi(int id) async {
    final db = await database;
    await db.delete('transaksi', where: 'id = ?', whereArgs: [id]);
  }
}
