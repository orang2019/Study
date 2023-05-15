import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/widget/note_add.dart';
import '../../controller/category_controller.dart';
import '../../model/category.dart';
import '../../model/color_index.dart';
import '../../model/note.dart';


class NoteHome extends StatelessWidget {
  const NoteHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController());
    return Scaffold(
      appBar: AppBar(
        title: Text('카테고리', style: TextStyle(color: Colors.black,fontSize: 20),),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body:
      Center(
          child: GetBuilder<CategoryController>(
            builder:(controller){
              return controller.observableBox.length==0?noCategory():hasCategory();
            },)
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => showModalBottomSheet(
            enableDrag: true,
            isDismissible: false,
            isScrollControlled: true,
            context: context,
            builder:(BuildContext context) => NoteAdd()),
        child: const Icon(Icons.add),
      ),
    );
  }

  noCategory(){
    return Center(
        child: Text('+버튼을 눌러\n새 노트를 추가하세요',
            style: TextStyle(color: Colors.grey,fontSize: 20),
            textAlign: TextAlign.center)
    );
  }

  hasCategory(){
    return GetBuilder<CategoryController>(
      builder: (cont) => DefaultTabController(
        length: cont.observableBox.length,
        child: Scaffold(
            body: Column(
              children: [
                TabBar(
                    isScrollable: true,
                    tabs: [
                      for(int i=0;i<cont.observableBox.length;i++)
                        Tab(text: cont.observableBox.getAt(i).categoryName),
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
                                  key: Key(note!.noteName),
                                  background: Container(color: Colors.red),
                                  child: Card(
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: (){
                                              print("Press BookMark");
                                              cont.changeNoteBookMark(i, index);
                                            }, icon: note.bookMark==true? Icon(Icons.star) : Icon(Icons.star_border_outlined),
                                          ),
                                          TextButton(onPressed: (){}, child: Text(note.noteName??"N/A")),
                                        ],
                                      )
                                  ),
                                  // onDismissed: (direction) {
                                  //   // 해당 index의 item을 리스트에서 삭제
                                  //   setState(() {
                                  //     items.removeAt(index);
                                  //   });
                                  //   // 삭제한 아이템을 스낵바로 출력
                                  //   Scaffold.of(context)
                                  //       .showSnackBar(SnackBar(content: Text("$item dismissed")));
                                  // },
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
}