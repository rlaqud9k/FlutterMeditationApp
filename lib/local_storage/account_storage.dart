// import 'package:hive/hive.dart';

// @HiveType()
// class AccountHive extends HiveObject {
// @HiveField(0)
// String name;
// @HiveField(1)
// int age;
// @HiveField(2)
// int meditationCount; 

// AccountHive(this.name);

// @override
// String toString() => name; // Just for print()
// }

// // void main() async {
// //   // Register Adapter
// //   Hive.registerAdapter(UserAdapter()); 

// //   var box

// //   box.put('david', User('David'));
// //   box.put('sandy', User('Sandy'));

// //   print(box.values);
// // }

// // Can be generated automatically
// class AccountHiveAdapter extends TypeAdapter<AccountHive> {
//   @override
//   final typeId = 0;

//   @override
//   AccountHive read(BinaryReader reader) {
//     return AccountHive(reader.read());
//   }

//   @override
//   void write(BinaryWriter writer, AccountHive obj) {
//     writer.write(obj.name);
//     writer.write(obj.age);
//     writer.write(obj.meditationCount);
//   }
// }