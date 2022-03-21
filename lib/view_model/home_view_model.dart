import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/model/count_data/count_data.dart';
import 'package:riverpod_countup/logic/count_data_logic.dart';
import 'package:riverpod_countup/logic/sound_logic.dart';
import 'package:riverpod_countup/state/provider.dart';

class HomeViewModel {
  final CountDataLogic _countDataLogic = CountDataLogic();
  final SoundLogic _soundLogic = SoundLogic();

  late WidgetRef _ref;

  void setRef(WidgetRef ref) {
    _ref = ref;
    _soundLogic.load();
  }

  get count => _ref.watch(countDataProvider).count.toString();

  get countUp =>
      _ref.watch(countDataProvider.select((value) => value.countUp)).toString();

  get countDown => _ref
      .watch(countDataProvider.select((value) => value.countDown))
      .toString();

  void onIncrease() {
    _countDataLogic.increase();
    _update();
  }

  void onDecrease() {
    _countDataLogic.decrease();
    _update();
  }

  void onReset() {
    _countDataLogic.reset();
    _update();
  }

  void _update() {
    CountData oldData = _ref.watch(countDataProvider);
    _ref
        .watch(countDataProvider.state)
        .update((state) => _countDataLogic.countData);
    CountData newData = _ref.watch(countDataProvider);
    _soundLogic.valueChanged(oldData, newData);
  }
}
