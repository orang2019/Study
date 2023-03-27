/// 새로운 노트이름 추가하기
/// 새로운 카테고리이름 추가하기 위해 버튼을 누르면, CategoryAdd 나타나기

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/widget/category_add.dart';
import 'package:study_app/controller/note_add_controller.dart';

class NoteAdd extends StatelessWidget {
  const NoteAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.8,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('노트 추가'),

            DropdownButton(
                value : selectedCategory, // 디폴트 = 선택값
                items: categoryList.map((item) { //전체 카테고리 list
                  return DropdownMenuItem(
                    value: item,
                    child: Text('$item'),);
                }).toList(),
                onChanged: (i){NoteAddController.to.changeCategory(i);}
            ),

            ElevatedButton(
              onPressed: (){
                showModalBottomSheet(
                    isDismissible: false, // 바깥영역 눌러도 안사라짐
                    isScrollControlled: true,
                    context: context,
                    builder:(BuildContext context) => const CategoryAdd());
              },
              child: const Text('+ 카테고리 추가하기'),
            ),


            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('노트 이름'),
                TextField(
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    hintText: '노트 이름을 입력하세요',
                    hintStyle: TextStyle(color: Color(0xffA3A3A3),),), //grey400
                  controller: NoteAddController.to.noteTextEditingController,
                ),],
            ),

            ElevatedButton(
              child: const Text('추가하기'),

              onPressed: () => NoteAddController.to.validateNoteData()? NoteAddController.to.NoteAddCreation() : null,
            ),
          ],
        ),

      ),
    );
  }
}
