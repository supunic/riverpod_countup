import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/model/postal_code/postal_code.dart';

PostalCodeInput _initPostalCodeInput() => const PostalCodeInput();

class PostalCodeInputNotifier extends StateNotifier<PostalCodeInput> {
  PostalCodeInputNotifier() : super(_initPostalCodeInput());

  PostalCodeInput get postalCodeInput => state;

  void reset() => state = _initPostalCodeInput();

  void update(String code) {
    final upper = code.substring(0, 3);
    final lower = code.substring(3);

    state = state.copyWith(
      code: code,
      upper: upper,
      lower: lower,
      path: '$upper/$lower.json',
    );
  }
}
