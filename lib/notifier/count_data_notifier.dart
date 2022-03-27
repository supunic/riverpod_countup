import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/model/count_data/count_data.dart';

class CountDataNotifier extends StateNotifier<CountData> {
  CountDataNotifier() : super(CountData.empty());

  CountData get countData => state;

  void reset() => state = CountData.empty();

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
