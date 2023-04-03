import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CategoryAddController extends GetxController {

  static CategoryAddController get to => Get.find();
  RxInt selectedColorIndex = 0.obs;
  RxBool isReview = true.obs;
  Color? eventColor = Color(0xffFAD3D3);
  var now = DateTime.now();

  //
  //
  // /// Select color on tap.
  // void selectColor(index) {
  //     selectedColorIndex = index;
  // }
  //
  // void changeReview(value){
  //   isReview = value;
  // }
  //
  //
  // void CategoryAddCreation() {
  //
  //   // 데이터 저장 후 뒤로가기
  //   // if : 복습하지 않음 선택
  //   // else : 복습함 선택
  //
  //   final eventColor = eventColors[_selectedColorIndex]; // 선택한 색
  //
  //   if (isReview==false){
  //     //저장
  //     addCategoryProvider(
  //       CategoryReview(
  //         categoryname: _eventNameController.text,
  //         day: now,
  //         eventColor: eventColor.toString(),
  //       ),);
  //   }
  //
  //   else{
  //     List eventList = [1, 4, 7, 14, 21];
  //     var eventDay = eventList.map((e) => now.add(Duration(days: e))).toList(); // List-> DateTime
  //
  //     for (var i in eventDay) {
  //       //저장
  //       addCategoryProvider(
  //         CategoryReview(
  //           categoryname: _eventNameController.text,
  //           day: i,
  //           // 2023-02-16 23:41:02.946679
  //           // 2023-02-19 23:41:02.946679
  //           // 2023-02-22 23:41:02.946679
  //           // 2023-03-01 23:41:02.946679
  //           // 2023-03-08 23:41:02.946679
  //           eventColor: eventColor.toString(),
  //         ),);
  //     }
  //   }
  //
  //   Get.back();
  // }



}
