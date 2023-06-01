import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controller/category_controller.dart';

import '../../widget/qa_add.dart';


class NoteQuiz extends StatelessWidget {
  //const NoteQuiz({Key? key}) : super(key: key);
  int i;
  int index;
  NoteQuiz({required this.i, required this.index});
  @override
  Widget build(BuildContext context) {
    double x = context.width.toDouble();
    double y = context.height.toDouble();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,),color: Colors.black, onPressed: ()=>Get.back(),),
        actions: [
          Row(children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.edit),color: Colors.black,),
          IconButton(onPressed: (){}, icon: Icon(Icons.delete),color: Colors.black,),
        ],)],
      ),

      body: GetBuilder<CategoryController>(builder: (controller)=> Column(
        children: [
          Text(controller.observableBox.getAt(i).noteList[index].noteName),
          controller.observableBox.getAt(i).noteList[index].QAList.length!=0?hasQA():noQA(),
          FloatingActionButton(child: Icon(Icons.add), onPressed: ()=>showModalBottomSheet(
            enableDrag: true,
            isDismissible: false,
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) => QaAdd(categoryIndex: i, noteIndex: index,),
          ))
        ],
      ))

    );
  }

  hasQA(){
    return GetBuilder<CategoryController>(builder: (controller)=>
    Center(
      child: Column(
        children: [
          for(int indexQA=0;indexQA<controller.observableBox.getAt(i).noteList[index].QAList.length;indexQA++)
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Column(
                children: [
                  Container(
                    child: Text(controller.observableBox.getAt(i).noteList[index].QAList[indexQA].question),
                  ),
                  Container(
                    child: Text(controller.observableBox.getAt(i).noteList[index].QAList[indexQA].answer),
                  )
                ],
              )
              
              
            )
        ],
      ),
    )
    );

  }
  noQA(){
    return Text("No QA");
  }
}


// Align(
//           alignment: Alignment.topCenter,
//           child:  const Text('(노트이름)', style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,))),

//       backgroundColor: Colors.white,
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.black,
//         onPressed: () => showModalBottomSheet(
//             enableDrag: true,
//             isDismissible: false,
//             isScrollControlled: true,
//             context: context,
//             builder:(BuildContext context) => QaAdd(categoryIndex: i, noteIndex: index,)),
//         child: const Icon(Icons.add),
//       ),