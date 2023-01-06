// import 'dart:io';
// import 'dart:async';
// import 'package:path_provider/path_provider.dart';
// import 'package:project_tiket/model/keranjang.dart';
// import 'package:sqflite/sqflite.dart';

// class DbHelper {
//   static DbHelper _dbHelper;
//   static Database _database;

//   DbHelper._createObject();

//   factory DbHelper() {
//     if (_dbHelper == null) {
//       _dbHelper = DbHelper._createObject();
//     }
//     return _dbHelper;
//   }

//   Future<Database> initDb() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = directory.path + 'TiketBioskop.db';

//     var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);

//     return todoDatabase;
//   }

//   //buat tabel baru
//   void _createDb(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE Keranjang (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         jumlah INTEGER,
//         Total_harga INTEGER,
//         Id_user TEXT,
//         Id_jadwal TEXT,
//       );  
//     ''');
//   }

//   Future<Database> get database async {
//     if (_database == null) {
//       _database = await initDb();
//     }
//     return _database;
//   }

  
//   Future<List<Map<String, dynamic>>> selectkeranjang() async {
//     Database db = await this.database;
//     var mapList = await db.query('keranjang');
//     return mapList;
//   }

//   Future<List<Keranjang>> getkeranjang() async {
//     var mapList = await selectkeranjang();
//     int count = mapList.length;
//     List<Keranjang> list = List<Keranjang>();
//     for (int i = 0; i < count; i++) {
//       list.add(Keranjang.fromMap(mapList[i]));
//     }
//     return list;
//   }

// }