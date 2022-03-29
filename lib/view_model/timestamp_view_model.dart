import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/model/timestamp_data/timestamp_data.dart';
import 'package:riverpod_countup/provider/model/timestamp_data_provider.dart';

class TimestampViewModel {
  late final WidgetRef _ref;
  int _counter = 0;

  void setRef(WidgetRef ref) {
    _ref = ref;
  }

  AsyncValue<List<TimestampData>> get timestampData =>
      _ref.watch(timestampDataStreamProvider);

  void incrementCounter() {
    TimestampData countData = TimestampData(
      dateTime: DateTime.now(),
      count: _counter++,
    );
    _ref.read(timestampDataRepositoryProvider).saveCountData(countData);
  }
}

Stream<List<TimestampData>> onTimestampDataChange(
    StreamProviderRef<List<TimestampData>> ref) {
  return ref
      .read(timestampDataRepositoryProvider)
      .getSnapshots()
      .map((e) => e.docs.map((data) => _convert(data.data())).toList());
}

TimestampData _convert(Object? obj) {
  if (obj == null) {
    return TimestampData.empty();
  }

  var map = obj as Map<String, dynamic>;
  return TimestampData.fromJson(map);
}
