import 'package:flutter/material.dart';
import 'package:meditationapp/TimerState.dart';
import 'package:provider/provider.dart';

class MeditationPage extends StatelessWidget {
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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text('d'),
            Row(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
//                  ButtonTextChange();
//               context.read()<TimerStateNotifier>().TimeIncrease();
                  },
                  child: Text(context
                      .select<TimerState, int>((state) => state.TimerClick)
                      .toString()),
                ),
                FlatButton(
                  onPressed: () {
                    context.read<TimerStateNotifier>().TimeIncrease();
                  },
                  child: Text('시간추가'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
