import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/page/notepage/note_quiz.dart';
import 'package:study_app/widget/note_add.dart';
import '../../controller/category_controller.dart';
import '../../model/note.dart';


class NoteHome extends StatefulWidget {
  const NoteHome({super.key});

  @override
  State<NoteHome> createState() => _NoteHomeState();
}

class _NoteHomeState extends State<NoteHome> {
  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.edit),color: Colors.black,),

            GetBuilder<CategoryController>(
              builder: (controller)=>IconButton(onPressed: (){


                // showModalBottomSheet(
                //     enableDrag: true,
                //     isDismissible: true, // 바깥영역 눌러도 안사라짐
                //     isScrollControlled: true,
                //     context: context,
                //     builder:(BuildContext context) => const DeleteWidget());

                // controller.deleteCategory(index: 0);
              }, icon: Icon(Icons.delete),color: Colors.black,),)
          ]
      ),

      body:
        Container(
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<CategoryController>(builder:(controller){
                return controller.observableBox.length==0?noCategory():hasCategory();
                },),
            )
          ],
        ),
      ),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () => showModalBottomSheet(
            enableDrag: true,
            isDismissible: false,
            isScrollControlled: true,
            context: context,
            builder:(BuildContext context) => NoteAdd(),
          ),
          child: const Icon(Icons.add),
        ),
    );
  }

  noCategory(){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('카테고리',style: TextStyle(fontSize:20,color: Colors.black),),
          SizedBox(height: context.height/3,),
          Center(
            child: Text('+버튼을 눌러\n새 노트를 추가하세요',
                    style: TextStyle(color: Colors.grey,fontSize: 24),
                    textAlign: TextAlign.center),
          ),


        ],
      ),
    );
  }

  hasCategory(){
    return GetBuilder<CategoryController>(
      builder: (cont) => DefaultTabController(
        length: cont.observableBox.length,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
               TabBar(
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: const Color(0xffFAD3D3)),
                      tabs: [
                        for(int i=0;i<cont.observableBox.length;i++)
                          Tab(child: Align(
                                  alignment: Alignment.center,
                                  child: Text(cont.observableBox.getAt(i).categoryName,style: TextStyle(fontSize: 20)), //fontWeight: FontWeight.bold,
                                ),),
                      ]
                  ),
                
                Expanded(
                    child: TabBarView(
                        children: [
                          for(int i=0;i<cont.observableBox.length;i++)
                            ListView.builder(
                              itemCount: cont.observableBox.getAt(i).noteList!=null?cont.observableBox.getAt(i).noteList.length:0,
                              itemBuilder: (context, index){
                                Note? note = cont.observableBox.getAt(i).noteList[index];
                                return Dismissible(
                                  direction: DismissDirection.endToStart,
                                  onDismissed: (direction){
                                    cont.deleteNote(i, index);
                                  },
                                  key: Key(note!.noteName),
                                  background: Container(color: Colors.red),
                                  child: Card(
                                    child: Row(
                                      children: [ 
                                        IconButton(
                                          onPressed: (){
                                            cont.changeNoteBookMark(i, index);
                                          }, icon: note.bookMark==true? Icon(Icons.star) : Icon(Icons.star_border_outlined),
                                        ),
                                        TextButton(onPressed: ()=>showModalBottomSheet(
                                          enableDrag: true,
                                          isDismissible: false,
                                          isScrollControlled: true,
                                          context: context,
                                          builder:(BuildContext context) => NoteQuiz(i: i, index: index),
                                        ), child: Text(note.noteName??"N/A")),
                                      ],
                                    )
                                  ),
                                );
                              },
                            ),
                        ]
                    )
                ),
              ],
            )
        ),
      ),
    );
  }
  // hasCategory(){
  //   return GetBuilder<CategoryController>(
  //     builder: (cont) => DefaultTabController(
  //       length: cont.observableBox.length,
  //       child: Scaffold(
  //         appBar: AppBar(
  //           //backgroundColor: Colors.white,
  //           title: IconButton(onPressed: (){
  //                   cont.deleteCategory(index: 0);
  //                 }, icon: Icon(Icons.delete)),
  //           bottom: TabBar(
  //             isScrollable: true,
  //             tabs: [
  //               for(int i=0;i<cont.observableBox.length;i++)
  //                 Tab(text: cont.observableBox.getAt(i).categoryName, ),
  //             ]
  //           ),
  //         ),
  //         body: 
  //           TabBarView(
  //             children: [
  //               for(int i=0;i<cont.observableBox.length;i++)
  //                 ListView.builder(
  //                   itemCount: cont.observableBox.getAt(i).noteList!=null?cont.observableBox.getAt(i).noteList.length:0,
  //                   itemBuilder: (context, index){
  //                     Note? note = cont.observableBox.getAt(i).noteList[index];
  //                     return Dismissible(
  //                       direction: DismissDirection.endToStart,
  //                       onDismissed: (direction){
  //                         cont.deleteNote(i, index);
  //                       },
  //                       key: Key(note!.noteName),
  //                       background: Container(color: Colors.red),
  //                       child: Card(
  //                         child: Row(
  //                           children: [
  //                             IconButton(
  //                               onPressed: (){
  //                                 cont.changeNoteBookMark(i, index);
  //                               }, icon: note.bookMark==true? Icon(Icons.star) : Icon(Icons.star_border_outlined),
  //                             ),
  //                             TextButton(onPressed: ()=>showModalBottomSheet(
  //                               enableDrag: true,
  //                               isDismissible: false,
  //                               isScrollControlled: true,
  //                               context: context,
  //                               builder:(BuildContext context) => NoteQuiz(i: i, index: index),
  //                             ), child: Text(note.noteName??"N/A")),
  //                           ],
  //                         )
  //                       ),
  //                     );
  //                   },
  //                 ),
  //             ]
  //           ),
  //         )
  //       ),
  //   );
  // }
}