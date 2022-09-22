// import 'dart:io';

// import 'package:capar/app/data/models/TicketsUserModel/tikcets_user_model.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DataBaseHelper {
//   // DataBaseHelper._privateConstructor(); // Named constructor to create instance DatabaseHelper
//   //DataBaseHelper _databaseHelper = DataBaseHelper._privateConstructor();

//   static Database? _database;

//   static const dbName = 'passengers.db';
//   static const passengersTable = 'passengersTable';
//   static const tabId = 'id';
//   static const tabFirstN = 'firstName';
//   static const tabLastN = 'lstName';
//   static const tabGender = 'gender';
//   static const tabBirthD = 'bDate';
//   static const tabDocN = 'docNum';

//   Future<Database> get database async => _database ??= await initializeDb();

//   Future<Database> initializeDb() async {
//     String path = await getDatabasesPath();

//     return await openDatabase(
//       join(path, dbName),
//       onCreate: (db, version) async {
//         await db.execute(
//           "CREATE TABLE IF NOT EXISTS $passengersTable("
//           "$tabId INTEGER PRIMARY KEY,"
//           "$tabFirstN TEXT,"
//           "$tabLastN TEXT,"
//           "$tabGender TEXT,"
//           "$tabBirthD TEXT,"
//           "$tabDocN TEXT)",
//         );
//       },
//       version: 1,
//     );
//   }

//   // Future _createDb(Database db, int newVersion) async {
//   //   await db.execute(
//   //   '''
//   //   CREATE TABLE IF NOT EXISTS $passengersTable
//   //       ($tabId INTEGER PRIMARY KEY,
//   //       $tabFirstN TEXT,
//   //       $tabLastN TEXT,
//   //       $tabGender TEXT,
//   //       $tabBirthD TEXT,
//   //       $tabDocN TEXT)'''
//   //       );
//   // }

//   Future<List<Map<String, dynamic>>> getPassengersMapList() async {
//     Database db = await database;
//     return await db.query(passengersTable);
//   }

//   Future<int> insertOperation(List<TicketPassengersModel> model) async {
//     final Database db = await initializeDb();
//     // debug edip run eday?
//     // name ucin barik gelenok?
//     //  print(await db.query(DataBaseHelper.passengersTable));
//     int result = 0;
//     for (var models in model) {
//       result = await db.insert(passengersTable, models.toMap());
//     }
//     return result;
//   }

//   Future<int> updateFunction(TicketPassengersModel model) async {
//     Database db = await initializeDb();
//     return await db.update(
//       passengersTable,
//       model.toMap(),
//       where: '$tabId = ?',
//       whereArgs: [model.id],
//     );
//   }

//   Future<int> deleteFunction(int id) async {
//     Database db = await initializeDb();
//     return await db.delete(
//       passengersTable,
//       where: '$tabId=?',
//       whereArgs: [id],
//       //Gosyan yerin nirde
//     );
//   }

//   Future<int> getCount() async {
//     Database db = await initializeDb();
//     List<Map<String, dynamic>> x =
//         await db.rawQuery('SELECT COUNT (*) from $passengersTable');
//     int? result = Sqflite.firstIntValue(x);
//     return result!;
//   }

//   Future<List<TicketPassengersModel>> getPassengersList() async {
//     var passengersMapList = await getPassengersMapList();
//     int count = passengersMapList.length;
//     List<TicketPassengersModel> model = <TicketPassengersModel>[];

//     for (int i = 0; i < count; i++) {
//       model.add(TicketPassengersModel.fromMap(passengersMapList[i]));
//     }
//     return model;
//   }
// }
