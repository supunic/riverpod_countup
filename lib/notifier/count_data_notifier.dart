import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/model/count_data/count_data.dart';

CountData _initCountData() =>
    const CountData(count: 0, countUp: 0, countDown: 0);

class CountDataNotifier extends StateNotifier<CountData> {
  CountDataNotifier() : super(_initCountData());

  CountData get countData => state;

  void reset() => state = _initCountData();

  void increase() {
    state = state.copyWith(
      count: state.count + 1,
      countUp: state.countUp + 1,
    );
  }

  void decrease() {
    state = state.copyWith(
      count: state.count - 1,
      countDown: state.countDown + 1,
    );
  }
}
