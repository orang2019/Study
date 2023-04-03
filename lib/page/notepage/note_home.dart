import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controller/bottom_tab_bar_controller.dart';
import 'package:study_app/widget/bottom_tab_bar.dart';
import 'package:study_app/widget/note_add.dart';

class NoteHome extends StatelessWidget {
  const NoteHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // 데이터 없을때 appBar,body
      appBar: AppBar(title: const Text('카테고리',style: TextStyle(color: Colors.black,fontSize: 20),),  backgroundColor: Colors.white, shadowColor: Colors.transparent,),
      body:

      const Center(child: Text(
          '''+버튼을 눌러\n새 노트를 추가하세요''',style: TextStyle(color: Colors.grey,fontSize: 20),textAlign: TextAlign.center)),
      backgroundColor: Colors.white,

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => showModalBottomSheet(
              isDismissible: false, // 바깥영역 눌러도 안사라짐
              isScrollControlled: true,
              context: context,
              builder:(BuildContext context) => NoteAdd()),
        child: const Icon(Icons.add),
      ),
    );
  }
}