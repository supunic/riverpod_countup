import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/postal_code/postal_code.dart';
import '../provider/model/postal_code_provider.dart';

class SearchViewModel {
  late WidgetRef _ref;

  void setRef(WidgetRef ref) {
    _ref = ref;
  }

  // get postalCode => _ref.watch(postalCodeProvider);

  AsyncValue<PostalCode> get postalCode => _ref.watch(apiProvider);

  AsyncValue<PostalCode> get familyPostalCode =>
      _ref.watch(apiFamilyProvider(_ref.watch(postalCodeProvider)));

  void onPostalCodeChanged(String text) {
    if (text.length != 7) {
      return;
    }

    try {
      int.parse(text);
      _ref.watch(postalCodeProvider.notifier).state = text;
      print(text);
    } catch (ex) {}
  }
}
