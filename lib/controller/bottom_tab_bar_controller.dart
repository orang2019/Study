import 'package:get/get.dart';

class BottomTabBarController extends GetxController{
  static BottomTabBarController get to => Get.find();

  RxInt selectedIndex = 0.obs;

  void changeIndex(int index){

    selectedIndex(index);
  }
}