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
    double x = context.width.toDouble();
    double y = context.height.toDouble();

    return Container(
        color: Colors.white,
        height: context.height * 0.9,
        padding: EdgeInsets.only(top: context.height * 0.048, left: context.width * 0.04615, right: context.width * 0.04615, bottom: context.height * 0.048),
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('카테고리 추가',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                Expanded(
                  child: Container(padding: EdgeInsets.only(top: 0, left: context.width *0.02565,right: context.width  *0.02565, bottom: 0),
                    child: Column(
                        children: [
                          SizedBox(width: context.width, height: context.height * 0.0688,), //X

                          Column(
                            children: [
                              const Align(alignment: Alignment.centerLeft,child: Text('카테고리 이름',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,),)),
                              TextFormField(
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xffC9CACC)),
                                    ),
                                    hintText: '   카테고리 이름을 입력하세요',
                                    hintStyle:  TextStyle(fontSize:16,color: Color(0xffA3A3A3))),
                                controller: categoryNameController,
                                validator: (value){
                                  if(value==null||value.isEmpty){
                                    return 'Please enter some text';}
                                  return null;
                                  },),
                            ],
                          ),

                          SizedBox(width: context.width,
                            height: context.height * 0.071,), //XXX

                          Column(
                            children: [
                              const Align(alignment: Alignment.centerLeft,child: Text('색상',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,),)),
                              SizedBox(width:context.width,height: context.height*0.02,),
                              SizedBox(
                                height: y * 0.344,
                                child: GetBuilder<CategoryController>( builder: (context) {
                                    return GridView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(), // 고정
                                      itemCount:eventColors.length,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 6,
                                        mainAxisSpacing: x * 0.0165, //수평 Padding
                                        crossAxisSpacing: y * 0.0118 , //수직 Padding
                                        childAspectRatio: 1.0, // 가로세로 비율 1:1
                                          ),
                                          itemBuilder:  (context, index) {
                                            return GridTile(
                                              child: GestureDetector(
                                                onTap: (){ controller.selectColorIndex(index);},
                                                child: Container(
                                                  width: x * 0.113,
                                                  height: y * 0.113,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.rectangle,
                                                      color: index == controller.selectedColorIndex ? Colors.black : eventColors[index],
                                                      borderRadius: const BorderRadius.all(Radius.circular(2))
                                                  ),
                                                  child: index == controller.selectedColorIndex ? const Icon(Icons.check, color: Colors.white) : null,
                                                ),),);
                                            },);}
                                  ),
                              ),

                            ],
                          )

                        ]
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      width: x,
                      height: y * 0.0568,
                      child: GetBuilder<CategoryController>(
                          builder: (context) {
                            return ElevatedButton(
                              style: ButtonStyle( backgroundColor:  categoryNameController.text.isEmpty ? MaterialStateProperty.all(controller.beforeColor) :  MaterialStateProperty.all(controller.afterColor),shadowColor: const MaterialStatePropertyAll(Colors.transparent) ),
                              child: const Text('추가하기',style:TextStyle(color: Colors.white ,fontSize:16,fontWeight: FontWeight.bold )),
                              onPressed: (){
                                if(_formKey.currentState!.validate()){
                                  String categoryNameText = categoryNameController.text;
                                  int categoryColor = controller.selectedColorIndex;
                                  List<Note> temp = [];

                                  controller.createCategory(category: Category(categoryName: categoryNameText, categoryColorIndex: categoryColor, noteList: temp));
                                  Get.back();
                                }},);})),),
              ]),
        ));
  }
}




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:study_app/constants.dart';

// import '../controller/category_controller.dart';
// import '../model/color_index.dart';
// import 'package:study_app/model/category.dart';
// import '../model/note.dart';


// class CategoryAdd extends StatefulWidget {
//   const CategoryAdd({Key? key}) : super(key: key);

//   @override
//   State<CategoryAdd> createState() => _CategoryAddState();
// }

// class _CategoryAddState extends State<CategoryAdd> {
//   final _formKey = GlobalKey<FormState>(); //for storing form state.

//   TextEditingController categoryNameController = TextEditingController();
//   final controller = Get.put(CategoryController());






//   @override

//   void dispose() {
//     categoryNameController.dispose();
//     super.dispose();
//   }

//   @override
//   void setState(VoidCallback fn) {
//     super.setState(fn);
//   }



//   Widget build(BuildContext context) {




//     return Container(
//         color: Colors.white,
//         height: context.height * 0.9,
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Form(
//               key: _formKey,
//               child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         margin: const EdgeInsets.all(defaultMargin),
//                         child: const Text('카테고리 추가',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),
//                       Container(
//                         padding: const EdgeInsets.all(defaultPadding),
//                         height: context.height* 0.5,
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text('카테고리 이름',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,),),
//                               TextFormField(
//                                 decoration: const InputDecoration(
//                                     enabledBorder: UnderlineInputBorder(
//                                       borderSide: BorderSide(),
//                                     ),
//                                     hintText: '카테고리 이름을 입력하세요',
//                                     hintStyle:  TextStyle(fontSize:16,color: Color(0xffA3A3A3))),
//                                 controller: categoryNameController,
//                                 validator: (value){
//                                   if(value==null||value.isEmpty){
//                                     return 'Please';
//                                   }
//                                   return null;
//                                 },),
//                               const Padding(padding: EdgeInsets.all(columnPadding)),
//                               const Text('색상',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,),),
//                               const Padding(padding: EdgeInsets.all(childrenPadding)),

//                               Expanded(
//                                 child: GetBuilder<CategoryController>( builder: (context) {
//                                     return Align(
//                                       alignment: Alignment.center,
//                                       child: Container(
//                                         width: 350,
//                                         height: 350,
//                                         child: GridView.builder(
//                                           itemCount:eventColors.length,
//                                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                                             crossAxisCount: 6,
//                                             mainAxisSpacing: 0.0, //수평 Padding
//                                             crossAxisSpacing: 0.0, //수직 Padding
//                                             childAspectRatio: 1.0, // 가로세로 비율 1:1
//                                           ),

//                                           itemBuilder:  (context, index) {
//                                             return GridTile(

//                                               child: GestureDetector(
//                                                 onTap: (){ controller.selectColorIndex(index);},
//                                                 child: Container(
//                                                   foregroundDecoration: BoxDecoration(
//                                                     border: index == controller.selectedColorIndex
//                                                         ? Border.all(
//                                                         color: Colors.black.withOpacity(0.3),
//                                                         width: 4)
//                                                         : null,
//                                                     shape: BoxShape.rectangle,
//                                                     color: eventColors[index],

//                                                   ),
//                                                   width: 44,
//                                                   height: 44,
//                                                 ),

//                                               ),
//                                             );
//                                           },),
//                                       ),
//                                     );
//                                   }
//                                 ),
//                               ),


//                             ],),
//                         ),


//                       Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Container(
//                           width: context.width,
//                           height: 48,
//                           margin: const EdgeInsets.all(defaultMargin),
//                           child: GetBuilder<CategoryController>(
//                             builder: (context) {
//                               return ElevatedButton(
//                                 //todo : 색 setState
//                                     style: ButtonStyle( backgroundColor:  categoryNameController.text.isEmpty ? MaterialStateProperty.all(controller.beforeColor) :  MaterialStateProperty.all(controller.afterColor),shadowColor: const MaterialStatePropertyAll(Colors.transparent) ),
//                                     child: const Text('추가하기',style:TextStyle(color: Colors.white ,fontSize:16,fontWeight: FontWeight.bold )),
//                                     onPressed: (){
//                                       if(_formKey.currentState!.validate()){
//                                         String categoryNameText = categoryNameController.text;
//                                         int categoryColor = controller.selectedColorIndex;
//                                         List<Note> temp = [];

//                                         controller.createCategory(category: Category(categoryName: categoryNameText, categoryColorIndex: categoryColor, noteList: temp));
//                                         Get.back();
//                                       }
//                                     },
//                                   );
//                             }
//                           )
//                           ),
//                         ),
//                     ],
//               ),
//             ),
//           ),
//     );
//   }
// }