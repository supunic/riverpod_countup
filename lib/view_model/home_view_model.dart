import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/model/count_data/count_data.dart';
import 'package:riverpod_countup/service/count_data_service.dart';
import 'package:riverpod_countup/service/sound_service.dart';
import 'package:riverpod_countup/state/provider.dart';

class HomeViewModel {
  final CountDataService _countDataService = CountDataService();
  final SoundService _soundService = SoundService();

  late WidgetRef _ref;

  void setRef(WidgetRef ref) {
    _ref = ref;
    _soundService.load();
  }

  get count => _ref.watch(countDataProvider).count.toString();

  get countUp =>
      _ref.watch(countDataProvider.select((value) => value.countUp)).toString();

  get countDown => _ref
      .watch(countDataProvider.select((value) => value.countDown))
      .toString();

  void onIncrease() {
    _countDataService.increase();
    _update();
  }

  void onDecrease() {
    _countDataService.decrease();
    _update();
  }

  void onReset() {
    _countDataService.reset();
    _update();
  }

  void _update() {
    CountData oldData = _ref.watch(countDataProvider);
    _ref
        .watch(countDataProvider.state)
        .update((state) => _countDataService.countData);
    CountData newData = _ref.watch(countDataProvider);
    _soundService.valueChanged(oldData, newData);
  }
}
