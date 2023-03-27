import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteAddController extends GetxController{
  static NoteAddController get to => Get.find();


  selectedCategory = ; // 디폴트 카테고리

  void changeCategory(i){
    selectedCategory = i;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    categoryList = ; // 전체 카테고리
  }

  final noteTextEditingController = TextEditingController();

  /// Validate event info for enabling "OK" button.
  bool validateNoteData() {
    return noteTextEditingController.text.isNotEmpty; // 노트 이름 썼는지 확인하기
  }

  NoteAddCreation(){
    // 데이터 저장
    Get.back();
  }





}

