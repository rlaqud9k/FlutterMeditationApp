import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meditationapp/local_storage/local_storage.dart';
import 'local_storage.dart';
import 'package:uuid/uuid.dart';


class UuidPage {
  static UuidPage _singleton;

  // String name;
  // int age;
  // int meditationCount;  

  factory UuidPage(){
    return _singleton??= UuidPage._();
  }
  Box<dynamic> _box;
  UuidPage._();

  String _uuid;
  String get uuid => _uuid;
  Future<void> setup() async{

    _box = LocalStorage().myBox;
    _uuid = _box.getString('uuid');
    if(_uuid == null){
      final uuid = Uuid().v4().toString();
      await _box.put('uuid', uuid);
    }
  }



    Future<void> close() async{
    await Hive.close();
  }
}
