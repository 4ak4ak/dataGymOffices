import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:pet_project/model/gym.dart';
class  DBProvider {
  DBProvider._();
// Объявлем SINGLETON
  static final DBProvider db = DBProvider._();

  late Database

  _database ;

  String gymTable = 'gymTable';
  String colId = 'id';
  String companyName = 'company_name';
  String description = 'company_name';
  String typeOfPeriod = 'type_of_period';
  String price = 'price';


  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "Gym.db");
    return await openDatabase(path, version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE $gymTable ("
              "$colId INTEGER PRIMARY KEY AUTOINCREMENT,"
              "$companyName TEXT,"
              "$description TEXT,"
              "$typeOfPeriod TEXT,"
              "$price DOUBLE"
              ")");
        });
  }

  //READ
  Future<List<Gym>> getGym() async{
    Database db  = await this.database;
   final List<Map<String,dynamic>> officeMapList = await db.query(gymTable);
   final List<Gym> offices = [];
    officeMapList.forEach((gymMap) {
      offices.add(Gym.fromMap(gymMap));

    });
    return offices;
  }

  //INSERT
Future<Gym> insertGym(Gym gym )async{
  Database db  = await this.database;
  gym.id = await  db.insert('gymTable' , gym.toMap());
  return gym;
}

//UPDATE

Future<int> updateGym(Gym gym) async{
  Database db  = await this.database;
  return await db.update('gymTable' , gym.toMap(), where: '$colId = ?',whereArgs: [gym.id], );
}

//DELETE

Future<int> deleteGym(int id) async{
  Database db  = await this.database;
  return await db.delete('gymTable' ,  where:  '$colId = ?', whereArgs: [id],);
}
}
