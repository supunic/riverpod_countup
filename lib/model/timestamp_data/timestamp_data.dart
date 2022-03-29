import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'timestamp_data.freezed.dart';
part 'timestamp_data.g.dart';

@freezed
class TimestampData with _$TimestampData {
  const factory TimestampData({
    required DateTime dateTime,
    required int count,
  }) = _TimestampData;

  factory TimestampData.fromJson(Map<String, dynamic> json) =>
      _$TimestampDataFromJson(json);
}