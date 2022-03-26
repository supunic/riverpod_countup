import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/model/count_data/count_data.dart';
import 'package:riverpod_countup/notifier/count_data_notifier.dart';

final countDataNotifierProvider = StateNotifierProvider<CountDataNotifier, CountData>(
    (_) => CountDataNotifier());
