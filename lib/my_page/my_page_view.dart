import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meditationapp/local_storage/account.dart';
import 'package:meditationapp/local_storage/account_storage.dart';
import 'my_page_input.dart';

//입력폼 하나 //text로 읽기전용 하나
//Main에서 교환할것
class MyPageView extends StatelessWidget {
  Box<AccountHive> box = Hive.box<AccountHive>('userBox');
  // 여기선박스선언안됨
  // box.get()
  String name;
  int age;
  int meditationCount;

  // MyPageView({this.name, this.age, this.meditationCount})

  @override
  Widget build(BuildContext context) {
    AccountHive account = box.get('account');
    print(account.meditationCount);
    name = account.name;
    age = account.age;
    meditationCount = account.meditationCount;

    return Scaffold(
      appBar: AppBar(
        title: Text('MyPage'),
      ),
      body: Form(
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
              child: Text('$name'),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '나이',
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text('$age'),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '명상횟수',
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text('$meditationCount'),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  box.clear();

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyPageInput()));
                },
                child: Text('초기화'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
