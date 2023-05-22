import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:study_app/model/category.dart';
import 'package:study_app/repository/box_repository.dart';
import 'package:study_app/constants.dart';

class CategoryController extends GetxController{
  final Box _observableBox = BoxRepository.getBox();

  Box get observableBox => _observableBox;

  int selectedCategoryIndex = 0;
  int selectedColorIndex = 0;
  bool selectedReview = true;
  String categoryNameText = '';
  Color validateColor = beforeClickButton;
  Color beforeColor = beforeClickButton;
  Color afterColor = afterClickButton;

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

  selectIndex(int i){
    selectedCategoryIndex = i;
    update();
  }

  selectColorIndex(int i){
    selectedColorIndex = i;
    update();
  }
  selectReview(bool i){
    selectedReview = i;
    update();
  }

}