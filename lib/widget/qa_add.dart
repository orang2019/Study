import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controller/category_controller.dart';
import 'package:study_app/model/note.dart';
import 'package:study_app/model/qa.dart';


class QaAdd extends StatelessWidget {
  //const QaAdd({super.key});
  int categoryIndex, noteIndex;
  QaAdd({required this.categoryIndex, required this.noteIndex});
  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController());

    final _formKey = GlobalKey<FormState>(); //for storing form state.

  TextEditingController qController = TextEditingController();
  TextEditingController aController = TextEditingController();

  final controller = Get.put(CategoryController());
    double x = context.width.toDouble();
    double y = context.height.toDouble();

    return   Container(
        color: Colors.white,
        height: context.height * 0.9,
        padding: EdgeInsets.only(top: context.height * 0.048, left: context.width * 0.04615, right: context.width * 0.04615, bottom: context.height * 0.048),
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('(노트이름)',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                Expanded(
                  child: Container(padding: EdgeInsets.only(top: 0, left: context.width *0.02565,right: context.width  *0.02565, bottom: 0),
                    child: Column(
                        children: [
                          SizedBox(width: x, height: y* 0.0688,), //X

                          Column(
                            children: [
                              const Align(alignment: Alignment.centerLeft,child: Text('문제',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,),)),
                              // SizedBox(width:context.width,height: context.height*0.02,),
                              TextFormField(
                                  maxLines: 6,
                                  decoration:const InputDecoration(
                                      // contentPadding: EdgeInsets.only(bottom: y*0.198),
                                      focusedBorder:UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black),
                                      ),

                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xffC9CACC)),
                                      ),
                                      hintText: '내용을 입력하세요',
                                      hintStyle:  TextStyle(fontSize:16,color: Color(0xffA3A3A3))),
                                  controller: qController,
                                  validator: (value){
                                    if(value==null||value.isEmpty){
                                      return 'Please enter some text';}
                                    return null;
                                  },),

                              SizedBox(width: x, height: y* 0.0474,), //X

                              const Align(alignment: Alignment.centerLeft,child: Text('답',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,),)),
                              // SizedBox(width:context.width,height: context.height*0.02,),
                              TextFormField(
                                maxLines: 6,
                                decoration: const InputDecoration(
                                    // contentPadding: EdgeInsets.only(bottom: y*0.198),

                                    focusedBorder:UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                    ),

                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xffC9CACC)),
                                    ),
                                    hintText: '정답을 입력하세요',
                                    hintStyle:  TextStyle(fontSize:16,color: Color(0xffA3A3A3))),
                                controller: aController,
                                validator: (value){
                                  if(value==null||value.isEmpty){
                                    return 'Please enter some text';}
                                  return null;
                                },),
                            ],
                          ),
                        ]
                    ),
                  ),
                ),
                GetBuilder<CategoryController>(builder: (controller)=>
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      width: x,
                      height: y * 0.0568,
                      child: GetBuilder<CategoryController>(
                          builder: (context) {
                            return ElevatedButton(
                              style: ButtonStyle( backgroundColor:  (qController.text.isEmpty)&(aController.text.isEmpty) ? MaterialStateProperty.all(controller.beforeColor) :  MaterialStateProperty.all(controller.afterColor),shadowColor: const MaterialStatePropertyAll(Colors.transparent) ),
                              child: const Text('추가하기',style:TextStyle(color: Colors.white ,fontSize:16,fontWeight: FontWeight.bold ),),
                              onPressed: (){
                                if(_formKey.currentState!.validate()){
                                  String q = qController.text;
                                  String a = aController.text;
                                  Note temp = controller.observableBox.getAt(categoryIndex).noteList[noteIndex];
                                  temp.addQA(QA(question: q, answer: a));
                                  controller.observableBox.getAt(categoryIndex).updateNote(noteIndex, temp);
                                  controller.updateCategory(index: categoryIndex, 
                                    category: 
                                      controller.observableBox.getAt(categoryIndex)
                                    ,
                                  );

                                  // controller.createCategory(category: Category(categoryName: categoryNameText, categoryColorIndex: categoryColor, noteList: temp));

                                  Get.back();
                                }},);})),),)
              ]),
        ));
  }
}

/*

class QaAdd extends StatefulWidget {
  const QaAdd({Key? key}) : super(key: key);

  @override
  State<QaAdd> createState() => _QaAddState();
}

class _QaAddState extends State<QaAdd> {
  final _formKey = GlobalKey<FormState>(); //for storing form state.

  TextEditingController qController = TextEditingController();
  TextEditingController aController = TextEditingController();

  final controller = Get.put(CategoryController());




  @override
  void dispose() {
    qController.dispose();
    aController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double x = context.width.toDouble();
    double y = context.height.toDouble();

    return   Container(
        color: Colors.white,
        height: context.height * 0.9,
        padding: EdgeInsets.only(top: context.height * 0.048, left: context.width * 0.04615, right: context.width * 0.04615, bottom: context.height * 0.048),
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('(노트이름)',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                Expanded(
                  child: Container(padding: EdgeInsets.only(top: 0, left: context.width *0.02565,right: context.width  *0.02565, bottom: 0),
                    child: Column(
                        children: [
                          SizedBox(width: x, height: y* 0.0688,), //X

                          Column(
                            children: [
                              const Align(alignment: Alignment.centerLeft,child: Text('문제',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,),)),
                              // SizedBox(width:context.width,height: context.height*0.02,),
                              TextFormField(
                                  maxLines: 6,
                                  decoration:const InputDecoration(
                                      // contentPadding: EdgeInsets.only(bottom: y*0.198),
                                      focusedBorder:UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black),
                                      ),

                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xffC9CACC)),
                                      ),
                                      hintText: '내용을 입력하세요',
                                      hintStyle:  TextStyle(fontSize:16,color: Color(0xffA3A3A3))),
                                  controller: qController,
                                  validator: (value){
                                    if(value==null||value.isEmpty){
                                      return 'Please enter some text';}
                                    return null;
                                  },),

                              SizedBox(width: x, height: y* 0.0474,), //X

                              const Align(alignment: Alignment.centerLeft,child: Text('답',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,),)),
                              // SizedBox(width:context.width,height: context.height*0.02,),
                              TextFormField(
                                maxLines: 6,
                                decoration: const InputDecoration(
                                    // contentPadding: EdgeInsets.only(bottom: y*0.198),

                                    focusedBorder:UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                    ),

                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xffC9CACC)),
                                    ),
                                    hintText: '정답을 입력하세요',
                                    hintStyle:  TextStyle(fontSize:16,color: Color(0xffA3A3A3))),
                                controller: aController,
                                validator: (value){
                                  if(value==null||value.isEmpty){
                                    return 'Please enter some text';}
                                  return null;
                                },),
                            ],
                          ),
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
                              style: ButtonStyle( backgroundColor:  (qController.text.isEmpty)&(aController.text.isEmpty) ? MaterialStateProperty.all(controller.beforeColor) :  MaterialStateProperty.all(controller.afterColor),shadowColor: const MaterialStatePropertyAll(Colors.transparent) ),
                              child: const Text('추가하기',style:TextStyle(color: Colors.white ,fontSize:16,fontWeight: FontWeight.bold ),),
                              onPressed: (){
                                if(_formKey.currentState!.validate()){
                                  String q = qController.text;
                                  String a = aController.text;
                                  List<Note> temp = [];

                                  // controller.createCategory(category: Category(categoryName: categoryNameText, categoryColorIndex: categoryColor, noteList: temp));

                                  Get.back();
                                }},);})),),
              ]),
        ));
  }
}*/