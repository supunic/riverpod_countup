// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timestamp_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimestampData _$TimestampDataFromJson(Map<String, dynamic> json) {
  return _TimestampData.fromJson(json);
}

/// @nodoc
class _$TimestampDataTearOff {
  const _$TimestampDataTearOff();

  _TimestampData call({required DateTime dateTime, required int count}) {
    return _TimestampData(
      dateTime: dateTime,
      count: count,
    );
  }

  TimestampData fromJson(Map<String, Object?> json) {
    return TimestampData.fromJson(json);
  }
}

/// @nodoc
const $TimestampData = _$TimestampDataTearOff();

/// @nodoc
mixin _$TimestampData {
  DateTime get dateTime => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimestampDataCopyWith<TimestampData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimestampDataCopyWith<$Res> {
  factory $TimestampDataCopyWith(
          TimestampData value, $Res Function(TimestampData) then) =
      _$TimestampDataCopyWithImpl<$Res>;
  $Res call({DateTime dateTime, int count});
}

/// @nodoc
class _$TimestampDataCopyWithImpl<$Res>
    implements $TimestampDataCopyWith<$Res> {
  _$TimestampDataCopyWithImpl(this._value, this._then);

  final TimestampData _value;
  // ignore: unused_field
  final $Res Function(TimestampData) _then;

  @override
  $Res call({
    Object? dateTime = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$TimestampDataCopyWith<$Res>
    implements $TimestampDataCopyWith<$Res> {
  factory _$TimestampDataCopyWith(
          _TimestampData value, $Res Function(_TimestampData) then) =
      __$TimestampDataCopyWithImpl<$Res>;
  @override
  $Res call({DateTime dateTime, int count});
}

/// @nodoc
class __$TimestampDataCopyWithImpl<$Res>
    extends _$TimestampDataCopyWithImpl<$Res>
    implements _$TimestampDataCopyWith<$Res> {
  __$TimestampDataCopyWithImpl(
      _TimestampData _value, $Res Function(_TimestampData) _then)
      : super(_value, (v) => _then(v as _TimestampData));

  @override
  _TimestampData get _value => super._value as _TimestampData;

  @override
  $Res call({
    Object? dateTime = freezed,
    Object? count = freezed,
  }) {
    return _then(_TimestampData(
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimestampData with DiagnosticableTreeMixin implements _TimestampData {
  const _$_TimestampData({required this.dateTime, required this.count});

  factory _$_TimestampData.fromJson(Map<String, dynamic> json) =>
      _$$_TimestampDataFromJson(json);

  @override
  final DateTime dateTime;
  @override
  final int count;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimestampData(dateTime: $dateTime, count: $count)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimestampData'))
      ..add(DiagnosticsProperty('dateTime', dateTime))
      ..add(DiagnosticsProperty('count', count));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimestampData &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$TimestampDataCopyWith<_TimestampData> get copyWith =>
      __$TimestampDataCopyWithImpl<_TimestampData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimestampDataToJson(this);
  }
}

abstract class _TimestampData implements TimestampData {
  const factory _TimestampData(
      {required DateTime dateTime, required int count}) = _$_TimestampData;

  factory _TimestampData.fromJson(Map<String, dynamic> json) =
      _$_TimestampData.fromJson;

  @override
  DateTime get dateTime;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$TimestampDataCopyWith<_TimestampData> get copyWith =>
      throw _privateConstructorUsedError;
}
