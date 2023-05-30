import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controller/category_controller.dart';
import 'package:study_app/model/note.dart';
import 'package:study_app/widget/category_add.dart';

import '../constants.dart';

class DeleteWidget extends StatefulWidget {
  const DeleteWidget({Key? key}) : super(key: key);

  @override
  State<DeleteWidget> createState() => _DeleteWidgetState();
}

class _DeleteWidgetState extends State<DeleteWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: context.height * 0.458,
        padding: EdgeInsets.only(top: context.height * 0.0947, left: context.width * 0.04615, right: context.width * 0.04615, bottom: context.height * 0.048),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('[] 을\n삭제할까요?',style: TextStyle(fontSize:24,),textAlign: TextAlign.center),
            SizedBox(height: context.height*0.0284,),

            Center(child: Text('모든 노트가 삭제돼요',style: TextStyle(fontSize:16))),
            SizedBox(height: context.height*0.0568,),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(onPressed: null, style: ButtonStyle(padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.only(left: context.width*0.14,right: context.width*0.14,top: context.width*0.016,bottom: context.width*0.016))),child: Text('취소하기',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold))),
                  SizedBox(width: context.width*0.02,),
                  OutlinedButton(onPressed: null, style: ButtonStyle(padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.only(left: context.width*0.14,right: context.width*0.14,top: context.width*0.016,bottom: context.width*0.016)),backgroundColor: MaterialStateProperty.all(Colors.black)),child: Text('삭제하기',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.white))),

                ],
              ),
            )






          ],
        ),
    );
  }
}
