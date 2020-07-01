import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


extension BoxExt on Box{
  String getString(String key){
    final value =get(key);
    if(value != null && value is String){
      return value;
    }
    return null;
  }
}





class LocalStorage {
  static LocalStorage _singleton;

  factory LocalStorage(){
    return _singleton??= LocalStorage._();
  }
  Box<dynamic> _myBox;
  Box<dynamic> get myBox => _myBox;
  LocalStorage._();

  // var _key = Hive.generateSecureKey();
  var _key = [190, 49, 134, 73, 248, 83, 230, 116, 131, 27, 27, 30, 191, 110, 198, 171, 72, 10, 6, 197, 210, 171, 237, 123, 39, 19, 212, 203, 239, 212, 53, 85];

  Future<void> setup() async{
    await Hive.initFlutter();
    _myBox = await Hive.openBox('myBox', encryptionKey: _key);
  }
  


    Future<void> close() async{
    await Hive.close();
  }
}