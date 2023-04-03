import 'package:flutter/material.dart';
import 'package:study_app/controller/category_controller.dart';
import 'package:get/get.dart';
import 'package:study_app/model/category.dart';

//변수
const eventColors = [
  Color(0xffFAD3D3),
  Color(0xffF39192),
  Color(0xffFEE9B6),
  Color(0xffFED36E),
  Color(0xffC4EEC3),
  Color(0xff89DD89),
  Color(0xff92C3DF),
  Color(0xffF7F3FB),
  Color(0xffF0E2FE),
  Color(0xffF5F5F5),
  Color(0xffE5E5E5),
];

/// Validate event info for enabling "OK" button.
bool validateNoteData() {
  return TextEditingController().text.isNotEmpty; // 노트 이름 썼는지 확인하기
}


class CategoryAdd extends StatelessWidget {
  const CategoryAdd({Key? key}) : super(key: key);


  @override
  
  Widget build(BuildContext context) {
    TextEditingController categoryNameController = TextEditingController();
    final controller = Get.put(CategoryController());

    return Material(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: ListView(
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
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: (){
                      String categoryNameText = categoryNameController.text;
                      int categoryColorText = 1;
                      controller.createCategory(category: Category(categoryName: categoryNameText, categoryColorIndex: categoryColorText));
                      Navigator.pop(context);
                    },
                    child: const Text("Submit"),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
// addCategory(){
//     titleController.clear();
//     showDialog(context: context, builder: (context){
//     return Material(
//           child: Form(
//             child: Padding(
//               padding: const EdgeInsets.all(14),
//               child: ListView(
//                 children: [
//                   TextFormField(
//                     decoration: const InputDecoration(hintText: "Category Name"),
//                     controller: titleController,
//                     validator: (value){
//                       if(value==null||value.isEmpty){
//                         return 'Please enter some text';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(
//                     height: 20.0,
//                   ),
//                   ElevatedButton(
//                     onPressed: (){
//                       String categoryNameText = titleController.text;
//                       int categoryColorText = 1;
//                       controller.createCategory(category: Category(categoryName: categoryNameText, categoryColorIndex: categoryColorText));
//                       Navigator.pop(context);
//                     },
//                     child: const Text("Submit"),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//     },
//     );
//   }