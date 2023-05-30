import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controller/category_controller.dart';
import 'package:study_app/model/note.dart';
import 'package:study_app/widget/category_add.dart';

import '../constants.dart';
import '../model/category.dart';


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
                              children: [
                                Row(
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
                              hintStyle:  TextStyle(fontSize:16,color: Color(0xffA3A3A3))
                            ),
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
                child: GetBuilder<CategoryController>(builder: (controller) {
                  return ElevatedButton(
                    style: ButtonStyle(backgroundColor:MaterialStateProperty.all(beforeClickButton),shadowColor: const MaterialStatePropertyAll(Colors.transparent) ),
                    child: const Text('추가하기',style: TextStyle(color: Colors.white,fontSize:16,fontWeight: FontWeight.bold )),
                    onPressed: () => {                    
                      controller.observableBox.getAt(controller.selectedCategoryIndex).addNote(Note(noteName: noteNameController.text, bookMark: true)),
                      controller.updateCategory(index: controller.selectedCategoryIndex, category: controller.observableBox.getAt(controller.selectedCategoryIndex)),
                      Get.back(),  
                    },
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:study_app/controller/category_controller.dart';
// import 'package:study_app/model/note.dart';
// import 'package:study_app/widget/category_add.dart';

// import '../constants.dart';

// class NoteAdd extends StatefulWidget{
//   NoteAdd({Key? key}) : super(key: key);

//   @override
//   State<NoteAdd> createState() => _NoteAddState();
// }

// class _NoteAddState extends State<NoteAdd> {
//   final _formKey = GlobalKey<FormState>(); //for storing form state.
//   final controller = Get.put(CategoryController());
//   TextEditingController noteNameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       height: context.height * 0.9,
//       child: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 margin: const EdgeInsets.all(defaultMargin),
//                 child: const Text('노트 추가',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
//               ),
//               const Text('카테고리',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,),),
//               GetBuilder<CategoryController>(builder:(controller){
//                 return SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Wrap(
//                       children: [Row(
//                         children: [
//                           for(int i=0;i<controller.observableBox.length;i++)
//                             SizedBox(
//                               width: 200,
//                               child: Card(
//                                 color: i==controller.selectedCategoryIndex ?Colors.amber:Colors.white,
//                                 elevation: 5.0,
//                                 child:
//                                 ListTile(
//                                     title: Text(controller.observableBox.getAt(i).categoryName),
//                                     onTap: (){
//                                       controller.selectIndex(i);
//                                     }
//                                 ),
//                               ),
//                             )
//                         ],
//                       ),]
//                   ),
//                 );
//               }),
//               ElevatedButton(
//                 style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white),shadowColor: MaterialStatePropertyAll(Colors.transparent)),
//                 onPressed: (){
//                   showModalBottomSheet(
//                       enableDrag: true,
//                       isDismissible: true, // 바깥영역 눌러도 안사라짐
//                       isScrollControlled: true,
//                       context: context,
//                       builder:(BuildContext context) => const CategoryAdd());
//                 },
//                 child: Container(
//                   alignment: Alignment.center,
//                   child: const Text('+ 카테고리 추가하기', style: TextStyle(color: Colors.black,fontSize:16,fontWeight: FontWeight.bold ))
//                   ),
//               ),
//               const Padding(padding: EdgeInsets.all(columnPadding)),
//               const Text('노트이름',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,),),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                       enabledBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(),),
//                       hintText: '노트이름을 입력하세요',
//                       hintStyle:  TextStyle(fontSize:16,color: Color(0xffA3A3A3))),
//                   controller: noteNameController,
//                   validator: (value){
//                     if(value==null||value.isEmpty){
//                       return 'Please enter some text';
//                     }
//                     return null;
//                     },
//                 ),
//               const Padding(padding: EdgeInsets.all(columnPadding)),
//               const Text('복습주기',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,),),
//               const Padding(padding: EdgeInsets.all(childrenPadding)),
//               GetBuilder<CategoryController>(
//                       builder: (context) {
//                         return RadioListTile(
//                                       title: const Text('1 / 4 / 7 / 14 / 21일',style: TextStyle(fontSize: 16)),
//                                       value: true,
//                                       groupValue: controller.selectedReview,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           controller.selectedReview = value!;
//                                         });
//                                       },
//                                     );
//                       }
//                     ),
//               GetBuilder<CategoryController>(
//                       builder: (context) {
//                         return RadioListTile(
//                                       title: const Text('복습하지 않기',style: TextStyle(fontSize: 16)),
//                                       value: false,
//                                       groupValue: controller.selectedReview,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           controller.selectedReview = value!;
//                                         });
//                                       },
//                                     );
//                       }
//                     ),

//               //todo
//               // onPressed: () => NoteAddController.to.validateNoteData()? NoteAddController.to.NoteAddCreation() : null,
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   width: context.width,
//                   height: 48,
//                   margin: const EdgeInsets.all(defaultMargin),
//                   child: GetBuilder<CategoryController>(builder: (controller) {return ElevatedButton(
//                     style: ButtonStyle(backgroundColor:MaterialStateProperty.all(beforeClickButton),shadowColor: const MaterialStatePropertyAll(Colors.transparent) ),
//                     child: const Text('추가하기',style: TextStyle(color: Colors.white,fontSize:16,fontWeight: FontWeight.bold )),
//                     onPressed: () => {

//                         if(_formKey.currentState!.validate()){
//                           controller.observableBox.getAt(controller.selectedCategoryIndex).addNote(Note(noteName: noteNameController.text, bookMark: true)),
//                           controller.updateCategory(index: controller.selectedCategoryIndex, category: controller.observableBox.getAt(controller.selectedCategoryIndex)),
//                           Get.back()

//                         }

//                       //controller.updateCategory(index: controller.selectedCategoryIndex, category: Category(categoryName: "Test", categoryColorIndex: 3, noteList: [Note(noteName: "Text", bookMark: true)])),
//                     },
//                   );}
//                   ),

//                 ),
//               ),


//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


