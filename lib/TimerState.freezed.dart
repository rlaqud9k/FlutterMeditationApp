// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'TimerState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$TimerStateTearOff {
  const _$TimerStateTearOff();

  _TimerState call({int TimerClick = 0}) {
    return _TimerState(
      TimerClick: TimerClick,
    );
  }
}

// ignore: unused_element
const $TimerState = _$TimerStateTearOff();

mixin _$TimerState {
  int get TimerClick;

  $TimerStateCopyWith<TimerState> get copyWith;
}

abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res>;
  $Res call({int TimerClick});
}

class _$TimerStateCopyWithImpl<$Res> implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  final TimerState _value;
  // ignore: unused_field
  final $Res Function(TimerState) _then;

  @override
  $Res call({
    Object TimerClick = freezed,
  }) {
    return _then(_value.copyWith(
      TimerClick: TimerClick == freezed ? _value.TimerClick : TimerClick as int,
    ));
  }
}

abstract class _$TimerStateCopyWith<$Res> implements $TimerStateCopyWith<$Res> {
  factory _$TimerStateCopyWith(
          _TimerState value, $Res Function(_TimerState) then) =
      __$TimerStateCopyWithImpl<$Res>;
  @override
  $Res call({int TimerClick});
}

class __$TimerStateCopyWithImpl<$Res> extends _$TimerStateCopyWithImpl<$Res>
    implements _$TimerStateCopyWith<$Res> {
  __$TimerStateCopyWithImpl(
      _TimerState _value, $Res Function(_TimerState) _then)
      : super(_value, (v) => _then(v as _TimerState));

  @override
  _TimerState get _value => super._value as _TimerState;

  @override
  $Res call({
    Object TimerClick = freezed,
  }) {
    return _then(_TimerState(
      TimerClick: TimerClick == freezed ? _value.TimerClick : TimerClick as int,
    ));
  }
}

class _$_TimerState with DiagnosticableTreeMixin implements _TimerState {
  const _$_TimerState({this.TimerClick = 0}) : assert(TimerClick != null);

  @JsonKey(defaultValue: 0)
  @override
  final int TimerClick;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerState(TimerClick: $TimerClick)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimerState'))
      ..add(DiagnosticsProperty('TimerClick', TimerClick));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TimerState &&
            (identical(other.TimerClick, TimerClick) ||
                const DeepCollectionEquality()
                    .equals(other.TimerClick, TimerClick)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(TimerClick);

  @override
  _$TimerStateCopyWith<_TimerState> get copyWith =>
      __$TimerStateCopyWithImpl<_TimerState>(this, _$identity);
}

abstract class _TimerState implements TimerState {
  const factory _TimerState({int TimerClick}) = _$_TimerState;

  @override
  int get TimerClick;
  @override
  _$TimerStateCopyWith<_TimerState> get copyWith;
}
