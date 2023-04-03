/// 새로운 카테고리 만들기
/// 카테고리이름,색상,복습주기 가 저장됨

import 'package:flutter/material.dart';
import 'package:study_app/controller/category_add_controller.dart';

//변수
const eventColors = [
  Color(0xffFAD3D3),
  Color(0xffF39192),
  Color(0xffFEE9B6),
  Color(0xffFED36E),
  Color(0xffC4EEC3),
  Color(0xff89DD89),
  Color(0xff92C3DF),
  Color(0xffF7F3FB),
  Color(0xffF0E2FE),
  Color(0xffF5F5F5),
  Color(0xffE5E5E5),
];

/// Validate event info for enabling "OK" button.
bool validateNoteData() {
  return TextEditingController().text.isNotEmpty; // 노트 이름 썼는지 확인하기
}



class CategoryAdd extends StatelessWidget {
  const CategoryAdd({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('카테고리 추가'),

            // Container(
            //   child: Column(
            //     children: [
            //       Container(
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             const Text('카테고리 이름'),
            //             TextField(
            //               decoration: const InputDecoration(
            //                 enabledBorder: UnderlineInputBorder(
            //                   borderSide: BorderSide(),
            //                 ),
            //                 hintText: '카테고리 이름을 입력하세요',
            //                 hintStyle: TextStyle(color: Color(0xffA3A3A3),),), //grey400
            //               controller: TextEditingController(),
            //             ),],
            //         ),),
            //
            //
            //
            //
            //       const SizedBox(height: 14),
            //
            //
            //       /// Color selection raw.
            //       Container(
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //
            //             const Text('색상'),
            //             SingleChildScrollView(
            //               scrollDirection: Axis.horizontal,
            //               child: Container(
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     ...List.generate(
            //                       eventColors.length,
            //                           (index) => GestureDetector(
            //                         onTap: () {
            //                           CategoryAddController.to.selectColor;
            //                         },
            //                         child: Padding(
            //                           padding: const EdgeInsets.only(left: 8),
            //                           child: Container(
            //                             foregroundDecoration: BoxDecoration(
            //                               border: index == CategoryAddController.to.selectedColorIndex.value
            //                               //todo : 색 눌렀을 때 표시하는 방법
            //                                   ? Border.all(
            //                                   color: Colors.black.withOpacity(0.3),
            //                                   width: 4)
            //                                   : null,
            //                               shape: BoxShape.rectangle,
            //                               color: eventColors[index],
            //                             ),
            //                             width: 44,
            //                             height: 44,
            //                           ),
            //                         ),
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ),
            //
            //             //색상리스트
            //
            //
            //           ],
            //         ),),
            //
            //
            //
            //
            //       Container(
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             const Text('복습 주기'),
            //             //복습 주기
            //             RadioListTile(
            //               title: const Text('1 / 4 / 7 / 14 / 21일'),
            //               value: true,
            //               groupValue: CategoryAddController.to.isReview.value,
            //               onChanged: (value){CategoryAddController.to.changeReview(value);}
            //             ),
            //             RadioListTile(
            //               title: Text('주기 지정하지 않음'),
            //               value: false,
            //               groupValue: CategoryAddController.to.isReview.value,
            //               onChanged: (value){CategoryAddController.to.changeReview(value);}
            //             ),
            //
            //           ],
            //         ),),
            //
            //
            //
            //     ],
            //   ),
            // ),
            //
            // ElevatedButton(
            //   ///todo : text 입력 안했을 때 색
            //     child: const Text('추가하기'),
            //     //저장
            //     ///이전 카테고리이름 디폴트값 변경
            //     onPressed: () {
            //       return validateNoteData() ? CategoryAddController.to.CategoryAddCreation() : null; }
            // ),
          ],
        ),

      ),
    );
  }
}
