import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/model/timestamp_data/timestamp_data.dart';
import 'package:riverpod_countup/provider/model/timestamp_data_provider.dart';
import 'package:riverpod_countup/repository/firebase/timestamp_data_repository.dart';

final TimestampDataRepository _timestampDataRepository =
    TimestampDataRepository();

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
    _timestampDataRepository.saveCountData(countData);
  }
}

Stream<List<TimestampData>> onTimestampDataChange(
    StreamProviderRef<List<TimestampData>> ref) {
  return _timestampDataRepository
      .getSnapshots()
      .map((e) => e.docs.map((data) => _convert(data.data())).toList());
}

TimestampData _convert(Object? obj) {
  if (obj == null) {
    return TimestampData(dateTime: DateTime.now(), count: -1);
  }

  var map = obj as Map<String, dynamic>;
  return TimestampData.fromJson(map);
}
