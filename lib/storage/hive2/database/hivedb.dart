import 'package:flutter_classwork/storage/hive2/model/user_model.dart';
import 'package:hive/hive.dart';

class HiveDb{
  //creation of singleton class
  HiveDb._internal();// private named constructor

  static HiveDb instance = HiveDb._internal();  //single instance creation
  //factory constructor to access instance
  factory HiveDb(){      //HiveDb.instance
    return instance;
  }
  Future<void> addUser(User user) async{
    final db = await Hive.openBox<User>('userData');
    db.put(user.id, user);
  }
  Future<List<User>> getUser() async{
    final db = await Hive.openBox<User>('userData');
    return db.values.toList();
  }


}