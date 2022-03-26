import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/model/postal_code/postal_code.dart';

PostalCode _initPostalCode() => const PostalCode(code: '', data: []);

class PostalCodeNotifier extends StateNotifier<PostalCode> {
  PostalCodeNotifier() : super(_initPostalCode());

  PostalCode get postalCode => state;

  void updateCode(String code) {
    state = state.copyWith(code: code);
  }

  void reset() {
    state = _initPostalCode();
  }
}
