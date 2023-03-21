import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/page_list.dart';

void main(){
  runApp(
    GetMaterialApp(
      initialRoute: Routes.noteHome, 
      getPages: PageList.pages,
    )
  );
}