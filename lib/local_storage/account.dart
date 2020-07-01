// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'account_storage.dart';

// class Account {
//   static Account _singleton;

//   factory Account(){
//     return _singleton??= Account._();
//   }
//   var _myBox;

//   Account._();



//   Future<void> setup() async{
//     Hive.registerAdapter(AccountHiveAdapter()); 
//     _myBox = await Hive.openBox<AccountHive>('userBox');
//     // await Hive.initFlutter();
//     // _myBox = await Hive.openBox('myBox', encryptionKey: _key);
//   }
  


//     Future<void> close() async{
//     await Hive.close();
//   }
// }