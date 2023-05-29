import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'notemain.dart';
import 'package:study_app/widget/note_add.dart';
import '../../controller/category_controller.dart';
import '../../model/category.dart';
import '../../model/color_index.dart';
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
    late TabController _tabController ;

    // @override
    // void initState() {
    //   super.initState();
    //   _tabController = TabController(vsync: this, length: myTabs.length);
    // }

    // @override
    // void dispose() {
    //   _tabController.dispose();
    //   super.dispose();
    // }



    return Scaffold(


      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          actions: [
            IconButton(onPressed: (){Get.to(noteMain());}, icon: Icon(Icons.edit),color: Colors.black,),
            IconButton(onPressed: (){}, icon: Icon(Icons.delete),color: Colors.black,)]
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Text('(카테고리이름)',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black),),
          Center(
              child: Text('+버튼을 눌러\n새 노트를 추가하세요',
                  style: TextStyle(color: Colors.grey,fontSize: 20),
                  textAlign: TextAlign.center)
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
                // todo : _tabController 만들어서 i == 현재위치 일때, 고른 색상, text bold체로 변환
                DefaultTabController(
                  length: cont.observableBox.length,
                  child: TabBar(
                      isScrollable: true,
                      // controller: _tabController,
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