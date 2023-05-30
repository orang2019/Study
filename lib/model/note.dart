import 'package:hive_flutter/hive_flutter.dart';

import 'qa.dart';

part 'note.g.dart';
@HiveType(typeId: 2)
class Note extends HiveObject{

  @HiveField(1)
  String noteName;
  
  @HiveField(2)
  bool bookMark;

  @HiveField(3)
  List<QA> QAList;

  Note({required this.noteName, required this.bookMark, this.QAList = const []});

  stateBookMark(){
    bookMark !=bookMark;
  }
}