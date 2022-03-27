import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'count_data.freezed.dart';

part 'count_data.g.dart';

// コード生成
// flutter pub run build_runner build

// watch モード
// flutter pub run build_runner watch

@freezed
class CountData with _$CountData {
  const factory CountData({
    required int count,
    required int countUp,
    required int countDown,
  }) = _CountData;

  factory CountData.fromJson(Map<String, dynamic> json) =>
      _$CountDataFromJson(json);

  static empty() => const CountData(count: 0, countUp: 0, countDown: 0);
}
