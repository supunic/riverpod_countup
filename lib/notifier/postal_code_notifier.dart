import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/model/postal_code/postal_code.dart';

PostalCode _initPostalCode() => const PostalCode(code: '0000000', data: []);

class PostalCodeNotifier extends StateNotifier<PostalCode> {
  PostalCodeNotifier() : super(_initPostalCode());

  PostalCode get postalCode => state;

  void reset() => state = _initPostalCode();

  void updateCode(String code) {
    state = state.copyWith(
      code: code,
      upper: code.substring(0, 3),
      lower: code.substring(3),
    );
  }
}
