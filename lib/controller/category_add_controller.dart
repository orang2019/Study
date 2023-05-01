import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CategoryAddController extends GetxController {

  static CategoryAddController get to => Get.find();
  RxInt selectedColorIndex = 0.obs;
  RxBool isReview = true.obs;
  Color? eventColor = Color(0xffFAD3D3);
  var now = DateTime.now();

}
