import 'package:audioplayers/audioplayers.dart';
import 'package:riverpod_countup/model/count_data/count_data.dart';

class SoundLogic {
  static const soundDataUp = 'sounds/sound_data_up.mp3';
  static const soundDataDown = 'sounds/sound_data_down.mp3';
  static const soundDataReset = 'sounds/sound_data_reset.mp3';

  final AudioCache _cache = AudioCache(fixedPlayer: AudioPlayer());

  void load() {
    _cache.loadAll([soundDataUp, soundDataDown, soundDataReset]);
  }

  void valueChanged(CountData oldData, CountData newData) {
    if (newData.countUp == 0 && newData.countDown == 0 && newData.count == 0) {
      _playResetSound();
    } else if (oldData.countUp + 1 == newData.countUp) {
      _playUpSound();
    } else if (oldData.countDown + 1 == newData.countDown) {
      _playDownSound();
    }
  }

  void _playUpSound() {
    _cache.play(soundDataUp);
  }

  void _playDownSound() {
    _cache.play(soundDataDown);
  }

  void _playResetSound() {
    _cache.play(soundDataReset);
  }
}
