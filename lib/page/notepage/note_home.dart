import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/widget/note_add.dart';
import '../../controller/category_controller.dart';
import '../../model/category.dart';
import '../../model/color_index.dart';


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
            },
          )
        ),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () => showModalBottomSheet(
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

  hasCategory(){//수정 필요
    return GetBuilder<CategoryController>(
      builder: (controller) => ListView.builder(
        itemCount: controller.observableBox.length,
        itemBuilder: (context, index){
          Category? category = controller.observableBox.getAt(index);            
          return Card(
            child: ListTile(
              onTap: ()=> Get.to(NoteAdd()),
              title: Text(category?.categoryName?? "N/A"),
              textColor: colorIndex(category?.categoryColorIndex??1),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => controller.deleteCategory(index: index),
              ),
            ),
          );
        },
      ), 
    );
  }

}

/*
class NoteHome extends StatefulWidget {
  const NoteHome({super.key});

  @override
  State<NoteHome> createState() => _NoteHomeState();
}

class _NoteHomeState extends State<NoteHome> {
  final controller = Get.put(CategoryController());
  @override  
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('카테고리', style: TextStyle(color: Colors.black,fontSize: 20),),  
        backgroundColor: Colors.white, 
        shadowColor: Colors.transparent,
      ),

      body: 
        controller.categoryCount.value!=0?hasCategory():noCategory(),        
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () => showModalBottomSheet(
                isDismissible: false,
                isScrollControlled: true,
                context: context,
                builder:(BuildContext context) => NoteAdd()),
          child: const Icon(Icons.add),
        ),
    );
  }

  hasCategory(){
      return GetBuilder<CategoryController>(
        builder: (cont) => ListView.builder(
          itemCount: controller.categoryCount.value,
          itemBuilder: (context, index){
            Category? category = controller.observableBox.getAt(index);            
            return Card(
              child: ListTile(
                onTap: ()=> Get.to(NoteAdd()),
                title: Text(category?.categoryName?? "N/A"),
                textColor: colorIndex(category?.categoryColorIndex??1),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => controller.deleteCategory(index: index),
                ),
              ),
            );
          },
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
}

*/