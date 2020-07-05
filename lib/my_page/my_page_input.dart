import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meditationapp/local_storage/account.dart';
import 'package:meditationapp/local_storage/account_storage.dart';
import 'my_page_view.dart';

//입력폼 하나 //text로 읽기전용 하나
//Main에서 교환할것
class MyPageInput extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  String _name;
  int _age;
  Box<AccountHive> box = Hive.box<AccountHive>('userBox');
  AccountHive account;
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
            TextFormField(
              decoration: InputDecoration(hintText: '이름을 입력해주세요'),
              validator: (value){
                if(value.isEmpty){
                  return '이름을 입력해주세요';
                }else if(!(value is String)){
                  return '문자로 입력해주세요';
                }
                return null;
              },
              onSaved: (value){
                _name = value;
              },
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '나이',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: '나이를 입력해주세요'),
              validator: (value){
                if(value.isEmpty){
                  return '나이를 입력해주세요';
                }else if(!(int.parse(value) is int)){
                  return '숫자로 입력해주세요';
                }
                return null;
              },
              onSaved: (value){
                _age = int.parse(value);
              },
            ),
            Align(
              alignment: Alignment.topLeft,
              child: RaisedButton(onPressed: () {
                if(_formkey.currentState.validate()){
                  _formkey.currentState.save();
                  account = AccountHive();
                  account.age = _age;
                  account.name = _name;
                  account.meditationCount = 0;
                  box.put('account', account);
                  print('input Page'+ box.get('account').age.toString());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyPageView()));
                }
                // print(_name+' '+_age.toString());
              }, child: Text('Submit')),
            )
          ],
        ),
      ),
    );
  }
}
