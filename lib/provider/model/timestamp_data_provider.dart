import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/model/timestamp_data/timestamp_data.dart';
import 'package:riverpod_countup/repository/firebase/timestamp_data_repository.dart';
import 'package:riverpod_countup/view_model/timestamp_view_model.dart';

final timestampDataStreamProvider =
    StreamProvider<List<TimestampData>>(onTimestampDataChange);

final timestampDataRepositoryProvider =
    Provider<TimestampDataRepository>((ref) => TimestampDataRepositoryImpl());
