# 암기를 빠르게 도와주는 앱
---
# 프로젝트 소개
Project nickname : study
Project execution period : 2023.03 ~

study는 빠른 암기가 필요한 사람들을 위한 시스템으로, 단기 암기를 장기 암기로 바꿔 오래 기억할 수 있게 만든다.

시장에는 이미 단기암기를 위한 암기앱과 장기 암기를 위한 복습앱이 출시되어 있다. 그러나 하나의 앱에서 암기와 복습을 동시에 해결할 수 있는 앱이 없다.
따라서 단기암기를 장기암기로 바꾸는 체계적인 암기앱이 필요하다.

# 사용 방법

TabBar는 4개로 구성되어 있다.
첫 번째 TabBar에서 문제를 만들고 저장한다.
두 번째 TabBar에서 안다, 모른다를 클릭하는 방법으로 문제의 답을 맞춘다.
세 번째 TabBar에서 오늘 복습할 문제를 확인하고 암기 한다.
네 번째 TabBar에서 문제 출제 순서를 변경한다. (랜덤,오름차순,내림차순)


---
### 두 번째 TabBar

단기 암기가 가능하다. 

<img width="274" alt="image" src="https://github.com/orang2019/STUDY/assets/76255901/697aaa9a-22bf-4d02-bded-2a9597e37c2d">

### 세 번째 TabBar

장기 암기가 가능하다.

<img width="637" alt="image" src="https://github.com/orang2019/STUDY/assets/76255901/c62df9ac-8307-4fbb-8e4a-32cb23995dd3">

---

### 기능

1. 하나의 앱에서 암기카드 및 복습일정 기능을 함께 제공
* 첫 복습일 선택 시, 에빙하우스 망각곡선 주기에 맞게 복습 일정 자동 계산
* 첫 암기카드 생성시, 복습 일정도 자동 생성
* 암기카드 생성시, 카테고리 및 제목을 복습 리스트로 자동 연동
* 오늘 복습 리스트 클릭 시, 암기카드로 바로 이동
* 기기간 실시간 데이터 연동 ( 키보드 기기가 있는 MacBook, iPad ) 와 ( iPhone )

2. 다양한 입력 방식
* csv, 엑셀 파일로 입력
* 이미지
* 사진 촬영 후 text 자동 인식
* 기기간 실시간 복사&붙여넣기
* 녹음 기능

3. 암기 효율 증대
* 다양한 암기방법 제공 ( 플래시카드, 깜빡이 암기, 스피드매치(카드맞추기) 등 )
* 객관적인 암기 수준을 파악하기 위한 학습 통계 제공
* 개별 학습통계를 커뮤니티에서 경쟁
* 학습 전, 학습 중, 학습 후 북마크 기능
* 오름차순/내림차순/랜덤 문제 출제

---

# 시작 가이드

## dependencies

```dart
dependencies:
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  get:
  flutter:
    sdk: flutter

dev_dependencies:
  build_runner : ^2.3.3
  hive_generator: ^2.0.0
  flutter_test:
    sdk: flutter

```

