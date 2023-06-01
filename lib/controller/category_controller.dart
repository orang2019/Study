import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:study_app/model/category.dart';
import 'package:study_app/repository/box_repository.dart';
import 'package:study_app/constants.dart';

class CategoryController extends GetxController{
  final Box _observableBox = BoxRepository.getBox();

  Box get observableBox => _observableBox;

  int selectedCategoryIndex = 0; //노트 추가 시 선택된 카테고리 번호
  int selectedColorIndex = 0;    //카테고리 추가시 선택된 색 번호
  


  Color validateColor = beforeClickButton;
  Color beforeColor = beforeClickButton;
  Color afterColor = afterClickButton;

  createCategory({required Category category}){
    _observableBox.add(category);
    update();
  }

  updateCategory({required int index, required Category category}){
    _observableBox.putAt(index, category);
    update();
  }

  deleteCategory({required int index}){
    _observableBox.deleteAt(index);
    update();
  }

  selectIndex(int i){
    selectedCategoryIndex = i;
    update();
  }

  selectColorIndex(int i){
    selectedColorIndex = i;
    update();
  }

  changeNoteBookMark(int i, int index){
    _observableBox.getAt(i).noteList[index].bookMark =  observableBox.getAt(i).noteList[index].bookMark==true ? false:true;
    _observableBox.putAt(i, Category(categoryName: _observableBox.getAt(i).categoryName, categoryColorIndex: _observableBox.getAt(i).categoryColorIndex, noteList: _observableBox.getAt(i).noteList));
    update();
  }

  deleteNote(i, index){
    _observableBox.getAt(i).noteList.removeAt(index);
    _observableBox.put(i, Category(
      categoryName: _observableBox.getAt(i).categoryName, 
      categoryColorIndex: _observableBox.getAt(i).categoryColorIndex, 
      noteList: _observableBox.getAt(i).noteList
      ));
  }

  changeColorButton(bool b){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if(b){
          validateColor = beforeClickButton;
        }else{
          validateColor = afterClickButton;
        }
        update();
      });
  }
}