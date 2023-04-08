import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/widget/note_add.dart';
import '../../controller/category_controller.dart';
import '../../model/category.dart';
import '../../model/color_index.dart';

class NoteHome extends StatefulWidget {
  const NoteHome({super.key});

  @override
  State<NoteHome> createState() => _NoteHomeState();
}

class _NoteHomeState extends State<NoteHome> {
  final controller = Get.put(CategoryController());
  @override  
  Widget build(BuildContext context) {
    //Get.put(CategoryController());
    int categoryCount = controller.categoryCount.value;

    return Scaffold(
      appBar: AppBar(
        title: Text('카테고리',
        style: TextStyle(color: Colors.black,fontSize: 20),),  
        backgroundColor: Colors.white, 
        shadowColor: Colors.transparent,
      ),
      body: 
        hasCategory(),
        
        backgroundColor: Colors.white,
        

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () => showModalBottomSheet(
                isDismissible: false, // 바깥영역 눌러도 안사라짐
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
            if(controller.categoryCount.value<1){
              return Center(
                child: Text('+버튼을 눌러\n새 노트를 추가하세요',
                style: TextStyle(color: Colors.grey,fontSize: 20),
                textAlign: TextAlign.center)
              );
            }
            else{
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
            }
          },
        ),
      );
    
  }
  
}