import 'package:hive_flutter/hive_flutter.dart';
import 'note.dart';

part 'category.g.dart';

@HiveType(typeId: 1)
class Category extends HiveObject{

  @HiveField(1)
  String categoryName;

  @HiveField(2)
  final int categoryColorIndex;

  @HiveField(3)
  List<Note> noteList;

  Category({required this.categoryName, required this.categoryColorIndex, required this.noteList});

  getNoteList(){
    return noteList;
  }

  addNote(Note note){
    noteList.add(note);
  }

  updateNote(int index, Note note){
    noteList[index] = note;
  }

  deleteNote(int index){
    noteList.removeAt(index);
  }
}
