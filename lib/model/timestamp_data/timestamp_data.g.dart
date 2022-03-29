// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timestamp_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimestampData _$$_TimestampDataFromJson(Map<String, dynamic> json) =>
    _$_TimestampData(
      dateTime: DateTime.parse(json['dateTime'] as String),
      count: json['count'] as int,
    );

Map<String, dynamic> _$$_TimestampDataToJson(_$_TimestampData instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime.toIso8601String(),
      'count': instance.count,
    };
