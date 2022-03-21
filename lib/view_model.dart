import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/logic/count_data_logic.dart';
import 'package:riverpod_countup/provider.dart';

class ViewModel {
  final CountDataLogic _countDataLogic = CountDataLogic();

  late WidgetRef _ref;

  void setRef(WidgetRef ref) {
    _ref = ref;
  }

  get count => _ref.watch(countDataProvider).count.toString();

  get countUp =>
      _ref.watch(countDataProvider.select((value) => value.countUp)).toString();

  get countDown => _ref
      .watch(countDataProvider.select((value) => value.countDown))
      .toString();

  void onIncrease() {
    _countDataLogic.increase();
    _ref
        .watch(countDataProvider.state)
        .update((state) => _countDataLogic.countData);
  }

  void onDecrease() {
    _countDataLogic.decrease();
    _ref
        .watch(countDataProvider.state)
        .update((state) => _countDataLogic.countData);
  }

  void onReset() {
    _countDataLogic.reset();
    _ref
        .watch(countDataProvider.state)
        .update((state) => _countDataLogic.countData);
  }
}
