import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'qa.g.dart';

@HiveType(typeId: 3)
class QA{

  @HiveField(1)
  final String question;

  @HiveField(2)
  final String answer;

  QA({required this.question, required this.answer});
}