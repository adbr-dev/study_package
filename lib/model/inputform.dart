import 'package:hive_flutter/adapters.dart';

part 'inputform.g.dart';

@HiveType(typeId: 1)
class InputForm extends HiveObject {
  InputForm({
    required this.name,
    required this.age,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  int age;
}
