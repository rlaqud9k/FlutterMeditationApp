import 'package:flutter/material.dart';
import 'package:meditationapp/TimerState.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'youtube_player.dart';
class MeditationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TimerStateNotifier a = Provider.of<TimerStateNotifier>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: 
        YoutubePlay(),
      ),
    );
  }
}
