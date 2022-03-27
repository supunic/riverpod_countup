import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/model/postal_code/postal_code.dart';

class PostalCodeInputNotifier extends StateNotifier<PostalCodeInput> {
  PostalCodeInputNotifier() : super(PostalCodeInput.empty());

  PostalCodeInput get postalCodeInput => state;

  void reset() => state = PostalCodeInput.empty();

  void update(String code) {
    final upper = code.length >= 3 ? code.substring(0, 3) : '';
    final lower = code.length >= 3 ? code.substring(3) : '';

    state = state.copyWith(
      code: code,
      upper: upper,
      lower: lower,
      path: '$upper/$lower.json',
    );
  }

  bool isMatchTextLength(String text) {
    return text.length == PostalCodeInput.codeLength;
  }

  bool isFilled() {
    return state.code.length == PostalCodeInput.codeLength &&
        state.upper.isNotEmpty &&
        state.lower.isNotEmpty;
  }
}
