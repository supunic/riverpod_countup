import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/provider/model/count_data_provider.dart';
import 'package:riverpod_countup/service/sound_service.dart';

class HomeViewModel {
  final SoundService _soundService = SoundService();

  late final WidgetRef _ref;

  void setRef(WidgetRef ref) {
    _ref = ref;
  }

  void initSound() {
    _soundService.load();
  }

  String get count => _ref.watch(countDataNotifierProvider).count.toString();

  String get countUp => _ref
      .watch(countDataNotifierProvider.select((value) => value.countUp))
      .toString();

  String get countDown => _ref
      .watch(countDataNotifierProvider.select((value) => value.countDown))
      .toString();

  void onIncrease() {
    _withSound(_ref.read(countDataNotifierProvider.notifier).increase);
  }

  void onDecrease() {
    _withSound(_ref.read(countDataNotifierProvider.notifier).decrease);
  }

  void onReset() {
    _withSound(_ref.read(countDataNotifierProvider.notifier).reset);
  }

  void _withSound(void Function() update) {
    final oldData = _ref.read(countDataNotifierProvider);
    update();
    final newData = _ref.read(countDataNotifierProvider);
    _soundService.valueChanged(oldData, newData);
  }
}
