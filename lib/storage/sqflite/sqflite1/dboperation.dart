import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  //create database
  // OpenDb - user defined method to create db
  static Future<sql.Database> OpenDb() async {
    return sql.openDatabase('contact', version: 1,
        onCreate: (sql.Database db, int version) async {
          await createTable(db);
        });
  }

  //create Table
  static Future<void> createTable(sql.Database db) async {
    await db.execute("""CREATE TABLE mycontacts(
       id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
       name TEXT,
       phone TEXT
      )""");
  }

// insert data to database
  static Future<int> create_contact(String cname, String cphone) async {
    final db = await SQLHelper.OpenDb(); // to open database
    final data = {"name": cname, "phone": cphone};
    final id = db.insert('mycontacts', data);
    return id;
  }
// read all the data from db
  static Future<List<Map<String,dynamic>>> readData() async{
    final db = await SQLHelper.OpenDb();
    return db.query("mycontacts",orderBy: 'id');// read all the datas by id
  }

  static Future<int> updateContact(int? id, String name, String phone) async {
    final db = await SQLHelper.OpenDb();
    final udata = {'name':name,'phone':phone};
    final result = await db.update("mycontacts", udata, where: "id=?",whereArgs: [id]);
    return result;

  }
}