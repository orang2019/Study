import 'package:flutter/material.dart';
import 'package:study_app/controller/note_controller.dart';
import 'package:get/get.dart';
import 'package:study_app/model/category.dart';
import 'package:study_app/constants.dart';

//변수
const eventColors = [
  Color(0xffFAD3D3),
  Color(0xffF39192),
  Color(0xffFEE9B6),
  Color(0xffFED36E),
  Color(0xffC4EEC3),
  Color(0xff89DD89),
  Color(0xffD4E7F1),
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


class CategoryAdd extends StatefulWidget {
  const CategoryAdd({Key? key}) : super(key: key);

  @override
  State<CategoryAdd> createState() => _CategoryAddState();
}

class _CategoryAddState extends State<CategoryAdd> {
  final controller = Get.put(NoteAddController());
  int selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoteAddController>(builder: (cont)=>Container(
        color: Colors.white,
        height: context.height * 0.9,
        child: SingleChildScrollView(
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
                      controller: TextEditingController(),
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return 'Please enter some text';
                        }
                        return null;
                      },),
                    const Padding(padding: EdgeInsets.all(columnPadding)),
                    const Text('색상',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,),),
                    const Padding(padding: EdgeInsets.all(childrenPadding)),

                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 350,
                        height: 350,
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                            mainAxisSpacing: 0.0,
                            crossAxisSpacing: 0.0,
                            childAspectRatio: 1.0,
                          ),
                          itemCount:eventColors.length,
                          itemBuilder:  (context, index) {
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedColorIndex = index;
                                });},
                              child: Container(
                                foregroundDecoration: BoxDecoration(
                                  border: index == selectedColorIndex
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
                            );
                          },),
                      ),
                    ),


                  ],),),


              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: context.width,
                  height: 48,
                  margin: const EdgeInsets.all(defaultMargin),
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor:MaterialStateProperty.all(beforeClickButton),shadowColor: const MaterialStatePropertyAll(Colors.transparent) ),
                    child: const Text('추가하기',style: TextStyle(color: Colors.white,fontSize:16,fontWeight: FontWeight.bold )),

                    //todo
                    onPressed: () =>
                      // controller.createCategory(category: Category(categoryName: TextEditingController().text, categoryColorIndex: categoryColorText));
                      Navigator.pop(context)
                  ),
                ),
              ),
            ],
          ),
        ),
    ));
  }
}

    
    
    

    // return Material(
    //       child: Form(
    //         child: Padding(
    //           padding: const EdgeInsets.all(14),
    //           child: ListView(
    //             children: [
    //               TextFormField(
    //                 decoration: const InputDecoration(hintText: "Category Name"),
    //                 controller: categoryNameController,
    //                 validator: (value){
    //                   if(value==null||value.isEmpty){
    //                     return 'Please enter some text';
    //                   }
    //                   return null;
    //                 },
    //               ),
    //               const SizedBox(
    //                 height: 20.0,
    //               ),
    //               ElevatedButton(
    //                 onPressed: (){
    //                   String categoryNameText = categoryNameController.text;
    //                   int categoryColorText = 1;
    //                   controller.createCategory(category: Category(categoryName: categoryNameText, categoryColorIndex: categoryColorText));
    //                   Navigator.pop(context);
    //                 },
    //                 child: const Text("Submit"),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     );

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