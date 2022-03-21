import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/logic/count_data_logic.dart';
import 'package:riverpod_countup/logic/sound_logic.dart';
import 'package:riverpod_countup/provider.dart';

class ViewModel {
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
    _ref
        .watch(countDataProvider.state)
        .update((state) => _countDataLogic.countData);
    _soundLogic.playUpSound();
  }

  void onDecrease() {
    _countDataLogic.decrease();
    _ref
        .watch(countDataProvider.state)
        .update((state) => _countDataLogic.countData);
    _soundLogic.playDownSound();
  }

  void onReset() {
    _countDataLogic.reset();
    _ref
        .watch(countDataProvider.state)
        .update((state) => _countDataLogic.countData);
    _soundLogic.playResetSound();
  }
}
