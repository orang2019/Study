import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/constants.dart';

import '../controller/category_controller.dart';
import '../model/color_index.dart';
import 'package:study_app/model/category.dart';
import '../model/note.dart';


class CategoryAdd extends StatefulWidget {
  const CategoryAdd({Key? key}) : super(key: key);

  @override
  State<CategoryAdd> createState() => _CategoryAddState();
}

class _CategoryAddState extends State<CategoryAdd> {
  final _formKey = GlobalKey<FormState>(); //for storing form state.

  TextEditingController categoryNameController = TextEditingController();
  final controller = Get.put(CategoryController());






  @override

  void dispose() {
    categoryNameController.dispose();
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }



  Widget build(BuildContext context) {




    return Container(
        color: Colors.white,
        height: context.height * 0.9,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formKey,
              child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(defaultMargin),
                        child: const Text('카테고리 추가',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),
                      Container(
                        padding: const EdgeInsets.all(defaultPadding),
                        height: context.height* 0.5,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('카테고리 이름',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,),),
                              TextFormField(
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                    hintText: '카테고리 이름을 입력하세요',
                                    hintStyle:  TextStyle(fontSize:16,color: Color(0xffA3A3A3))),
                                controller: categoryNameController,
                                validator: (value){
                                  if(value==null||value.isEmpty){
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },),
                              const Padding(padding: EdgeInsets.all(columnPadding)),
                              const Text('색상',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,),),
                              const Padding(padding: EdgeInsets.all(childrenPadding)),

                              Expanded(
                                child: GetBuilder<CategoryController>( builder: (context) {
                                    return Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: 350,
                                        height: 350,
                                        child: GridView.builder(
                                          itemCount:eventColors.length,
                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 6,
                                            mainAxisSpacing: 0.0, //수평 Padding
                                            crossAxisSpacing: 0.0, //수직 Padding
                                            childAspectRatio: 1.0, // 가로세로 비율 1:1
                                          ),

                                          itemBuilder:  (context, index) {
                                            return GridTile(

                                              child: GestureDetector(
                                                onTap: (){ controller.selectColorIndex(index);},
                                                child: Container(
                                                  foregroundDecoration: BoxDecoration(
                                                    border: index == controller.selectedColorIndex
                                                        ? Border.all(
                                                        color: Colors.black.withOpacity(0.3),
                                                        width: 4)
                                                        : null,
                                                    shape: BoxShape.rectangle,
                                                    color: eventColors[index],

                                                  ),
                                                  width: 44,
                                                  height: 44,
                                                ),

                                              ),
                                            );
                                          },),
                                      ),
                                    );
                                  }
                                ),
                              ),


                            ],),
                        ),


                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: context.width,
                          height: 48,
                          margin: const EdgeInsets.all(defaultMargin),
                          child: GetBuilder<CategoryController>(
                            builder: (context) {
                              return ElevatedButton(
                                //todo : 색 setState
                                    style: ButtonStyle( backgroundColor:  categoryNameController.text.isEmpty ? MaterialStateProperty.all(controller.beforeColor) :  MaterialStateProperty.all(controller.afterColor),shadowColor: const MaterialStatePropertyAll(Colors.transparent) ),
                                    child: const Text('추가하기',style:TextStyle(color: Colors.white ,fontSize:16,fontWeight: FontWeight.bold )),
                                    onPressed: (){
                                      if(_formKey.currentState!.validate()){
                                        String categoryNameText = categoryNameController.text;
                                        int categoryColor = controller.selectedColorIndex;
                                        List<Note> temp = [];

                                        controller.createCategory(category: Category(categoryName: categoryNameText, categoryColorIndex: categoryColor, noteList: temp));
                                        Get.back();
                                      }
                                    },
                                  );
                            }
                          )
                          ),
                        ),
                    ],
              ),
            ),
          ),
    );
  }
}