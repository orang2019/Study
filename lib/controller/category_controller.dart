import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:study_app/model/category.dart';
import 'package:study_app/repository/box_repository.dart';

class CategoryController extends GetxController{
  final Box _observableBox = BoxRepository.getBox();

  Box get observableBox => _observableBox;

  int get categoryCount => _observableBox.length;

  createCategory({required Category category}){
    _observableBox.add(category);
    update();
  }

  updateCategory({required int index, required Category category}){
    _observableBox.put(index, category);
    update();
  }

  deleteCategory({required int index}){
    _observableBox.deleteAt(index);
    update();
  }
}