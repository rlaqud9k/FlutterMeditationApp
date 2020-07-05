import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meditationapp/TimerState.dart';
import 'package:meditationapp/my_page/my_page_view.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:meditationapp/meditation_explanation_Page.dart';
import 'local_storage/local_storage.dart';
import 'local_storage/uuid_storage.dart';
import 'local_storage/account.dart';
import 'my_page/my_page_input.dart';
import 'my_page/my_page_view.dart';
import 'local_storage/account.dart';
import 'local_storage/account_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

//void main () => runApp은 기본포맷임 arrow아니더라도 그냥{}로도 가능
//ctrl + shift + r 위젯 추가
void main() {
  boot();
}

Future<void> boot() async {
  await LocalStorage().setup();
  await UuidPage().setup();
  await Account().setup();
  runApp(
    MultiProvider(
      providers: [
        StateNotifierProvider<TimerStateNotifier, TimerState>(
          create: (_) => TimerStateNotifier(),
        )
      ],
      child: MaterialApp(
        home: new myApp(),
      ),
    ),
  );
}

//
List<String> TitleList = ['CandleMeditation', 'ChakraMeditation'];

List<String> CandleMeditationCard = [
  '1. 촛불을 응시하세요',
  '2. 눈을 감고싶을때 눈을 감습니다',
  '3. 촛불의 잔상에 집중합니다\n(잔상을 원하는만큼 유지하세요)',
  '4. 눈을 감고 눈동자를 움직여서 미간을 바라보세요',
  '5. 그 상태를 유지하면서 들이마시는 숨에 귀를 기울이세요'
];

List<String> ChakraMeditationCard = [
  '차크라는 척추를 타고 회음부에서 정수리로 흘러갑니다',
  '1. 꼬리뼈에 빨간색 수레바퀴가 회전한다고 상상하세요',
  '2. 배꼽밑에 주황색 수레바퀴가 회전한다고 상상하세요',
  '3. 명치밑에서 노란색 수레바퀴가 회전한다고 상상하세요',
  '4. 가슴에 초록색 수레바퀴가 회전한다고 상상하세요',
  '5. 목에서 파란색 수레바퀴가 회전한다고 상상하세요',
  '6. 미간에서 남색 수레바퀴가 회전한다고 상상하세요',
  '7. 정수리에서 보라색 수레바퀴가 회전한다고 상상하세요',
];

Widget acccountInfomation(){
    Box<AccountHive> box = Hive.box<AccountHive>('userBox');
    Widget widget;
    // print(box.length);
    if(box.length == 0){
       widget = MyPageInput();
    }else{
       widget = MyPageView();
    }

    return widget;
}


class myApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    List<String> TitleList = ['CandleMeditation', 'ChakraMeditation'];
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person_pin),
            tooltip: 'Mypage',
            iconSize: 40,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>acccountInfomation(), 
                  //MyPageView(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Image.asset('images/ows.jpg', height: 350, fit: BoxFit.fill),
          ),
          Expanded(
            child: FlatButton(
              child: Expanded(
                child: Image.asset(
                  'images/candle.jpg',
                  height: 150,
                  fit: BoxFit.fill,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MeditationExplainPage(
                            TitleList[0], CandleMeditationCard)));
              },
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Image.asset('images/chakara.jpg',
                  height: 150, fit: BoxFit.fill),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MeditationExplainPage(
                            TitleList[1], ChakraMeditationCard)));
              },
            ),
          )
        ],
      ),
    );
  }
}
