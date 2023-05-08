import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controller/category_controller.dart';
import 'package:study_app/model/note.dart';
import 'package:study_app/widget/category_add.dart';

import '../constants.dart';


class NoteAdd extends StatelessWidget {
  const NoteAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController());
    TextEditingController noteNameController = TextEditingController();
    
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

                          GetBuilder<CategoryController>(builder:(controller){
                            return Wrap(
                              children: [Row(
                                children: [
                                  for(int i=0;i<controller.observableBox.length;i++)
                                  SizedBox(
                                    width: 200,
                                    child: Card(
                                      color: i==controller.selectedCategoryIndex ?Colors.amber:Colors.white,
                                      elevation: 5.0,
                                      child: 
                                        ListTile(                           
                                          title: Text(controller.observableBox.getAt(i).categoryName),
                                          onTap: (){
                                            controller.selectIndex(i);
                                            print(controller.selectedCategoryIndex);

                                          }
                                        ),
                                    ),
                                  )
                                ],
                              ),]
                            );
                          }),
                          
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
                            controller: noteNameController,
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
                child: GetBuilder<CategoryController>(builder: (controller) {return ElevatedButton(
                  style: ButtonStyle(backgroundColor:MaterialStateProperty.all(beforeClickButton),shadowColor: const MaterialStatePropertyAll(Colors.transparent) ),
                  child: const Text('추가하기',style: TextStyle(color: Colors.white,fontSize:16,fontWeight: FontWeight.bold )),
                  onPressed: () => {                    
                    controller.observableBox.getAt(controller.selectedCategoryIndex).addNote(Note(noteName: noteNameController.text, bookMark: true)),
                    controller.updateCategory(index: controller.selectedCategoryIndex, category: controller.observableBox.getAt(controller.selectedCategoryIndex)),

                    //controller.updateCategory(index: controller.selectedCategoryIndex, category: Category(categoryName: "Test", categoryColorIndex: 3, noteList: [Note(noteName: "Text", bookMark: true)])),
                  },
                );}
              ),
            ),)
          ],
        ),
      ),
    );
  }
}