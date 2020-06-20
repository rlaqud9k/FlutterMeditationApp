import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'TimerState.freezed.dart';
//part 'Timer_State.g.dart';

@freezed
abstract class TimerState with _$TimerState {

  const factory TimerState({
//    Timer timer,
//    @Default('00') String hour,
//    @Default('00') String min,
//    @Default('00') String sec,
//    @Default('시작') String ButtonText,
    @Default(0) int TimerClick,
  }) = _TimerState;
//  factory TimerState.fromJson(Map<String, dynamic> json) => _$TimerStateFromJson(json);
}

class TimerStateNotifier extends StateNotifier<TimerState>{
  TimerStateNotifier() : super(TimerState());

  TimeIncrease() => state = state.copyWith(TimerClick : state.TimerClick+1);

}