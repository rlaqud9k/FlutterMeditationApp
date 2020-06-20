import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meditationapp/TimerState.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier/state_notifier.dart';



class testController extends StateNotifier<int>{
  testController() : super(0);
  int count = 0;
}

//void main () => runApp은 기본포맷임 arrow아니더라도 그냥{}로도 가능
void main() => runApp(MaterialApp(
      home: new myApp(), //navigator 직접박으면 안움직임
    ));

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

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> TitleList = ['CandleMeditation', 'ChakraMeditation'];
    return MultiProvider(
      providers: [StateNotifierProvider<TimerStateNotifier, TimerState>(create: (_) => TimerStateNotifier(),)],
      child : MaterialApp(
        home: Scaffold(
          appBar: Text(context.read()),
          backgroundColor: Colors.black26,
//            appBar: AppBar(
//              title: Text('index'),
//            ),

          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child:
                Image.asset('images/ows.jpg', height: 350, fit: BoxFit.fill),
              ),
              GestureDetector(
                child: Image.asset(
                  'images/candle.jpg',
                  height: 150,
                  fit: BoxFit.fill,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ImageClick(TitleList[0], CandleMeditationCard)));
                },
              ),
              GestureDetector(
                child: Image.asset('images/chakara.jpg',
                    height: 150, fit: BoxFit.fill),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ImageClick(TitleList[1], ChakraMeditationCard)));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageClick extends StatefulWidget {
  ImageClick(this.AppBarTitle, this.MeditationMethodCard);
  String AppBarTitle;
  List<String> MeditationMethodCard;

  @override
  _ImageClickState createState() => _ImageClickState();
}

class _ImageClickState extends State<ImageClick> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          floatingActionButton: Builder(

            builder: (context) {
              return new FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TimerPage(),
                    ),
                  );
                },
                label: Text('타이머'),
                icon: Icon(Icons.fast_forward),
              );
            }
          ),
          appBar: AppBar(title: Text('df')),
          body: SafeArea(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: widget.MeditationMethodCard.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
//                  color: Colors.amber[colorCodes[index]],
                    child:
                        Center(child: Text(widget.MeditationMethodCard[index])),
                  );
                }),
          )),
    );
  }
}

class TimerPage extends StatelessWidget {

//  String hour = '00';
//  String min =  '00';
//  String sec =  '00';
//  Timer timer;
//  String ButtonText = '시작';
//  int TimerClick = 0;
//
//  ButtonTextChange(){
//    print('ButtonTextChange');
//    if(ButtonText == '시작'){
//       timer = new Timer.periodic(Duration(seconds: 1), (timer) {
//         if(int.parse(sec) > 0){
//           sec = (int.parse(sec) -1).toString();
//         }else{
//           sec = (int.parse(sec) + 59).toString();
//           if(int.parse(min) > 0){
//             min = (int.parse(min) -1).toString();
//           }else if(int.parse(min) > 0){
//             min = (int.parse(min) + 59).toString();
//             hour = (int.parse(hour) -1).toString();
//           }
//         }
//       });
//
//
//              print(hour);
//              print(min);
//              print(sec);
//
//
//
//       ButtonText = '정지';
//    }else{
//       timer.cancel();
//
//
//              print(hour);
//              print(min);
//              print(sec);
//
//       ButtonText = '시작';
//    }
//  }
//  TimerClickChange(){
//     print('TimerClickChange');
//     TimerClick += 1;
//
//     min = (int.parse(min) + 15).toString();
//     if(int.parse(min) >= 60){
//       min = (int.parse(min) - 60).toString();
//       hour = (int.parse(hour) + 1).toString() ;
//
//     }
//
//      if(int.parse(min) == 0){
//        min = '00';
//      }
//      if(int.parse(sec) == 0){
//        sec = '00';
//      }
//
//       print(hour);
//       print(min);
//       print(sec);
//
//
//
//
//  }
//

  @override
  Widget build(BuildContext context) {
   TimerStateNotifier a = Provider.of<TimerStateNotifier>(context);


    return Scaffold(
      body : SafeArea(
        child: Column(children: <Widget>[
          Text('d'),
          Row(
           children: <Widget>[

             FlatButton(
               onPressed: (){
//                  ButtonTextChange();
//               context.read()<TimerStateNotifier>().TimeIncrease();

               },
               child: Text('a'),
             ),
             FlatButton(
               onPressed: (){
//                   TimerClickChange();
               },
               child: Text('시간추가'),
             ),
           ],
          ),
        ] ,),
      ),
    );
  }
}
