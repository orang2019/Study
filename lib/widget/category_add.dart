import 'package:flutter/material.dart';
import 'package:study_app/controller/category_controller.dart';
import 'package:get/get.dart';
import 'package:study_app/model/category.dart';
import 'package:study_app/model/color_index.dart';


class CategoryAdd extends StatelessWidget {
  const CategoryAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController categoryNameController = TextEditingController();
    TextEditingController categoryColorController = TextEditingController();//컬러인덱스를 수동으로 입력하기 위한 것, 나중에 누르는 것으로 바꾸면 제거

    final controller = Get.put(CategoryController());

    return Form(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Category Name"),
                    controller: categoryNameController,
                    validator: (value){
                      if(value==null||value.isEmpty){
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 100.0,
                  ),
                  TextFormField(//수동 컬러 입력, 나중에 제거
                    decoration: const InputDecoration(hintText: "Category Color"),
                    controller: categoryColorController,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: (){
                      String categoryNameText = categoryNameController.text;
                      int categoryColorText = int.parse(categoryColorController.text);
                      controller.createCategory(category: Category(categoryName: categoryNameText, categoryColorIndex: categoryColorText));
                      Navigator.pop(context);
                    },
                    child: const Text("Submit"),
                  ),
                ],
              ),
            ),
          );
  }
}