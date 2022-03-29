import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timestamp_data.freezed.dart';

part 'timestamp_data.g.dart';

abstract class TimestampDataRepository {
  void saveCountData(TimestampData timestampData);

  Stream<QuerySnapshot> getSnapshots();
}

@freezed
class TimestampData with _$TimestampData {
  const factory TimestampData({
    required DateTime dateTime,
    required int count,
  }) = _TimestampData;

  factory TimestampData.fromJson(Map<String, dynamic> json) =>
      _$TimestampDataFromJson(json);
}
