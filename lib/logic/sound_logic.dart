import 'package:audioplayers/audioplayers.dart';

class SoundLogic {
  static const soundDataUp = 'sounds/sound_data_up.mp3';
  static const soundDataDown = 'sounds/sound_data_down.mp3';
  static const soundDataReset = 'sounds/sound_data_reset.mp3';

  final AudioCache _cache = AudioCache(
    fixedPlayer: AudioPlayer(),
  );
  
  void load() {
    _cache.loadAll([soundDataUp, soundDataDown, soundDataReset]);
  }

  void playUpSound() {
    _cache.play(soundDataUp);
  }

  void playDownSound() {
    _cache.play(soundDataDown);
  }

  void playResetSound() {
    _cache.play(soundDataReset);
  }
}
