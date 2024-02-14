import 'dart:io';
// ignore: depend_on_referenced_packages
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

Future<Database> openDatabaseapp() async {
  Directory app = await getApplicationDocumentsDirectory();
  String dbpart = '${app.path}/smart_care_data.db';
  final db = await databaseFactoryIo.openDatabase(dbpart);
  return db;
}

Future deletedatabase() async {
  Database db = await openDatabaseapp();
  var store = intMapStoreFactory.store('smart_care');
  await store.drop(db);
}

Future<bool> addDataInfoToDatabase(
  String name,
  String surname,
  DateTime birthdate,
  String? imageFile,
  int level,
) async {
  deletedatabase();
  final db = await openDatabaseapp();
  final store = intMapStoreFactory.store('smart_care');

  await store.add(db, {
    "name": name,
    "surname": surname,
    "birthdate": birthdate.toLocal().toString(),
    "imageFile": imageFile,
    "level": level,
  });

  await db.close();
  return true;
}

Future<List<RecordSnapshot<int, Map<String, Object?>>>> getAllData() async {
  Database db = await openDatabaseapp();
  StoreRef<int, Map<String, Object?>> store =
      intMapStoreFactory.store('smart_care');
  List<RecordSnapshot<int, Map<String, Object?>>> records =
      await store.find(db);

  return records;
}

//
Future<Database> openDatabaseInit() async {
  Directory app = await getApplicationDocumentsDirectory();
  String dbpart = '${app.path}/smart_care_init.db';
  final db = await databaseFactoryIo.openDatabase(dbpart);
  return db;
}

Future deletedatabaseInit() async {
  Database db = await openDatabaseInit();
  var store = intMapStoreFactory.store('smart_care_init');
  await store.drop(db);
}

Future<bool> addDataInfoTodataInit(
  String language,
) async {
  deletedatabaseInit();
  final db = await openDatabaseInit();
  final store = intMapStoreFactory.store('smart_care_init');
  await store.add(db, {
    "language": language,
  });
  await db.close();
  return true;
}

Future<List<RecordSnapshot<int, Map<String, Object?>>>> getAllDataInit() async {
  Database db = await openDatabaseInit();
  StoreRef<int, Map<String, Object?>> store =
      intMapStoreFactory.store('smart_care_init');
  List<RecordSnapshot<int, Map<String, Object?>>> records =
      await store.find(db);

  return records;
}

//
Future<Database> openDatabaseHealthCheck() async {
  Directory app = await getApplicationDocumentsDirectory();
  String dbpart = '${app.path}/smart_care_HealthCheck.db';
  final db = await databaseFactoryIo.openDatabase(dbpart);
  return db;
}

Future<bool> addDataInfoTodataHealthCheck(
  String sys,
  String dia,
  String spo2,
  String temp,
  String width,
  String height,
  String dateTime,
) async {
  final db = await openDatabaseHealthCheck();
  final store = intMapStoreFactory.store('smart_care_HealthCheck');
  await store.add(db, {
    'sys': sys,
    'dia': dia,
    'spo2': spo2,
    'temp': temp,
    'width': width,
    'height': height,
    'dateTime': dateTime,
  });
  await db.close();
  return true;
}

Future<bool> updateDataInfoInDataHealthCheck(
  int id,
  String sys,
  String dia,
  String bp,
  String temp,
  String width,
  String height,
  String dateTime,
) async {
  final db = await openDatabaseHealthCheck();
  final store = intMapStoreFactory.store('smart_care_HealthCheck');
  await store.update(
    db,
    {
      'sys': sys,
      'dia': dia,
      'spo2': bp,
      'temp': temp,
      'width': width,
      'height': height,
      'dateTime': dateTime,
    },
    finder: Finder(
      filter: Filter.byKey(id),
    ),
  );
  await db.close();
  return true;
}

Future<bool> deleteDataInfoFromDataHealthCheck(int id) async {
  final db = await openDatabaseHealthCheck();
  final store = intMapStoreFactory.store('smart_care_HealthCheck');
  await store.delete(
    db,
    finder: Finder(
      filter: Filter.byKey(id),
    ),
  );
  await db.close();
  return true;
}

Future<List<RecordSnapshot<int, Map<String, Object?>>>>
    getAllDataHealthCheck() async {
  Database db = await openDatabaseHealthCheck();

  StoreRef<int, Map<String, Object?>> store =
      intMapStoreFactory.store('smart_care_HealthCheck');
  List<RecordSnapshot<int, Map<String, Object?>>> records =
      await store.find(db);
  print(records);
  return records;
}
//