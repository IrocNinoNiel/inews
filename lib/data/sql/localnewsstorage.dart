import 'package:practice4/data/model/news.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  final _dbName = 'dbsqlitefavoritenews.db';
  final _dbVersion = 1;

  final tableName = 'favoriteNews';

  final colID = 'id';
  final colTitle = 'title';
  final colAuthor = 'author';
  final colDescription = 'description';
  final colImgLink = 'imglink';
  final colContent = 'content';
  final colSource = 'source';
  final colPublishedAt = 'publishedAt';
  final colFavorite = 'favorite';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    final sql =
        'CREATE TABLE $tableName($colID TEXT PRIMARY KEY, $colTitle TEXT NOT NULL, $colAuthor TEXT NOT NULL,$colDescription TEXT NOT NULL, $colImgLink TEXT NOT NULL, $colContent TEXT NOT NULL, $colSource TEXT NOT NULL, $colPublishedAt TEXT NOT NULL, $colFavorite BOOLEAN NOT NULL)';

    await db.execute(sql);
  }

  Future<List<Map<String, dynamic>>> getLocalStorageNews() async {
    Database db = await instance.database;
    var res = await db.query(tableName);
    return res.toList();
  }

  Future<int> addToFavoriteNews(News news) async {
    Database db = await instance.database;
    var res = await db.insert(tableName, news.toMap());
    return res;
  }

  Future<void> deleteFavoriteNews(String id) async {
    Database db = await instance.database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
