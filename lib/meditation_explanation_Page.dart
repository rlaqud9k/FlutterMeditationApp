import 'package:flutter/material.dart';
import 'package:meditationapp/meditation_page.dart';
import 'youtube_player.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'local_storage/account_storage.dart';


class MeditationExplainPage extends StatefulWidget {
  MeditationExplainPage(this.AppBarTitle, this.MeditationMethodCard);
  String AppBarTitle;
  List<String> MeditationMethodCard;
  Box<AccountHive> box = Hive.box<AccountHive>('userBox');


  @override
  _MeditationExplainPageState createState() => _MeditationExplainPageState();
}

class _MeditationExplainPageState extends State<MeditationExplainPage> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              AccountHive account = widget.box.get('account');
              account.meditationCount +=1;
              account.save();
              // print(account.meditationCount.toString());
              
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => YoutubePlay(),
                ),
              );
            },
          child: Icon(Icons.fast_forward),
          ),
          appBar: AppBar(title: Text('')),
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
