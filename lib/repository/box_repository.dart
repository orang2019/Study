import 'package:hive_flutter/hive_flutter.dart';
import 'package:study_app/model/category.dart';

class BoxRepository{
  static const String boxName = "CRUD";

  static openBox() async => await Hive.openBox<Category>(boxName);

  static Box getBox() => Hive.box<Category>(boxName);

  static closeBox() async => await Hive.box(boxName).close();
}