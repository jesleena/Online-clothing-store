import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class User {

  @HiveField(0)
  final String email;

  @HiveField(1)
  final String password;

  @HiveField(2)
  String? id;

  @HiveField(3)
  String? name;

  @HiveField(4)
  int? age;

  User({required this.email, required this.password,this.name,this.age}) {
    id = DateTime.now().microsecondsSinceEpoch.toString();
  }
}