import 'package:flutter/material.dart';

//입력폼 하나 //text로 읽기전용 하나
//Main에서 교환할것
class MyPageView extends StatelessWidget {

  final _formkey = GlobalKey<FormState>();
  String name = 'udrhk';
  int age =11;
  int meditationCount =11;

  // MyPageView({this.name, this.age, this.meditationCount})


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyPage'),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '이름',
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
                          child: Text(
                '$name'
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '나이',
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
                          child: Text(
                '$age'
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '명상횟수',
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
                          child: Text(
                '$meditationCount'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
