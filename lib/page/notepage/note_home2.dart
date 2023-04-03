// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:study_app/controller/category_controller.dart';
// import 'package:study_app/model/category.dart';
// import 'package:study_app/model/color_index.dart';
// import 'package:study_app/widget/note_add.dart';

// class NoteHome extends StatefulWidget {
//   const NoteHome({super.key});

//   @override
//   State<NoteHome> createState() => _NoteHomeState();
// }

// class _NoteHomeState extends State<NoteHome> {
//   final controller = Get.put(CategoryController());
//   final TextEditingController titleController = TextEditingController();

//   @override
//   void dispose(){
//     titleController.dispose();
//     super.dispose();
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('카테고리',
//         style: TextStyle(color: Colors.black,fontSize: 20),),  
//         backgroundColor: Colors.white, shadowColor: Colors.transparent,
//       ),
//       body: 
//         GetBuilder<CategoryController>(
//         builder: (cont) => ListView.builder(
//           itemCount: cont.categoryCount,
//           itemBuilder: (context, index){
//             if(cont.categoryCount>0){
//               Category? category = cont.observableBox.getAt(index);
//               return Card(
//                 child: ListTile(
//                   onTap: ()=> Get.to(NoteAdd()),
//                   title: Text(category?.categoryName?? "N/A"),
//                   textColor: colorIndex(category?.categoryColorIndex??1),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () => cont.deleteCategory(index: index),
//                   ),
//                 ),
//               );
//             }
//             else{
//               return const Center(
//                 child: Text('''+버튼을 눌러\n새 노트를 추가하세요''',
//                 style: TextStyle(color: Colors.grey,fontSize: 20),
//                 textAlign: TextAlign.center)
//               );
//             }
//           },
//         )
//       ),
//       backgroundColor: Colors.white,

//       floatingActionButton: FloatingActionButton(
//         onPressed: () => showModalBottomSheet(
//         isDismissible: false, // 바깥영역 눌러도 안사라짐
//         isScrollControlled: true,
//         context: context,
//         builder:(BuildContext context) => NoteAdd()),
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

  
// }