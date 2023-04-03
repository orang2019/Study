/// 새로운 노트이름 추가하기
/// 새로운 카테고리이름 추가하기 위해 버튼을 누르면, CategoryAdd 나타나기

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/widget/category_add.dart';
import 'package:study_app/controller/note_add_controller.dart';

import '../constants.dart';

class NoteAdd extends StatelessWidget {
  NoteAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: context.height * 0.9,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: const EdgeInsets.all(defaultMargin),
                child: const Text('노트 추가',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(defaultPadding),
                height: context.height* 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('카테고리',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,),),
                          ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white),shadowColor: MaterialStatePropertyAll(Colors.transparent)),
                            onPressed: (){
                              showModalBottomSheet(
                                isDismissible: false, // 바깥영역 눌러도 안사라짐
                                isScrollControlled: true,
                                context: context,
                                builder:(BuildContext context) => const CategoryAdd()
                              );
                            },
                            child: Container(
                                alignment: Alignment.center,
                                child: const Text('+ 카테고리 추가하기',
                                style: TextStyle(color: Colors.black,fontSize:16,fontWeight: FontWeight.bold ))
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('노트이름',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,),),
                          TextField(
                            decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                                hintText: '노트이름을 입력하세요',
                                hintStyle:  TextStyle(fontSize:16,color: Color(0xffA3A3A3))),
                            controller: TextEditingController(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: context.width,
                height: 48,
                margin: const EdgeInsets.all(defaultMargin),
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor:MaterialStateProperty.all(beforeClickButton),shadowColor: const MaterialStatePropertyAll(Colors.transparent) ),
                  child: const Text('추가하기',style: TextStyle(color: Colors.white,fontSize:16,fontWeight: FontWeight.bold )),
                  onPressed: () => NoteAddController.to.validateNoteData()? NoteAddController.to.NoteAddCreation() : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
