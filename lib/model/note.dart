import 'qa.dart';

class Note{
  String noteName;
  bool bookMark;

  late List<QA> QAList;

  Note({required this.noteName, required this.bookMark});

  addQA(QA qa){
    QAList.add(qa);
  }
  removeQA(QA qa){
    QAList.remove(qa);
  }
  changeNoteName(String newName){
    noteName = newName;
  }
  selectBookMark(){
    bookMark = !bookMark;
  }
}