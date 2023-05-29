import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controller/qa_controller.dart';
import 'package:study_app/widget/QaAdd.dart';

class noteMain extends StatelessWidget {
  const noteMain({Key? key}) : super(key: key);

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

      body: Align(
          alignment: Alignment.topCenter,
          child:  const Text('(노트이름)', style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,))),


      // Center(
      //
      //     // child: GetBuilder<QaController>(
      //     //   builder:(controller){
      //     //     return controller.observableBox.length==0?noQa():hasQa();
      //     //   },
      //     // )
      //
      // ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => showModalBottomSheet(
            enableDrag: true,
            isDismissible: false,
            isScrollControlled: true,
            context: context,
            builder:(BuildContext context) => QaAdd()),
        child: const Icon(Icons.add),
      ),

    );
  }
}
