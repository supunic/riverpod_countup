import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/count_data/count_data.dart';

final countDataProvider = StateProvider<CountData>(
  (ref) => const CountData(count: 0, countUp: 0, countDown: 0),
);