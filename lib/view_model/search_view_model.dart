import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/model/postal_code/postal_code.dart';
import 'package:riverpod_countup/provider/model/postal_code_provider.dart';

class SearchViewModel {
  late final WidgetRef _ref;

  void setRef(WidgetRef ref) {
    _ref = ref;
  }

  PostalCode get _postalCode => _ref.watch(postalCodeNotifierProvider);

  AsyncValue<PostalCode> get postalCodeFuture =>
      _ref.watch(postalCodeFutureProvider);

  AsyncValue<PostalCode> get postalCodeFutureFamily =>
      _ref.watch(postalCodeFutureFamilyProvider(_postalCode));

  void onChange(String text) {
    if (text.length != 7) {
      return;
    }

    try {
      int.parse(text);
      _ref.read(postalCodeNotifierProvider.notifier).updateCode(text);
    } catch (ex) {}
  }
}

Future<PostalCode> onPostalCodeChange(FutureProviderRef<PostalCode> ref) async {
  final _newPostalCode = ref.watch(postalCodeNotifierProvider);
  final _postalCodeRepository = ref.read(postalCodeRepositoryProvider);

  if (_newPostalCode.code.length != 7) {
    throw Exception("Postal Code must be 7 characters");
  }

  return await _postalCodeRepository.search(_newPostalCode);
}

FutureOr<PostalCode> onPostalCodeChangeByFamily(
    AutoDisposeFutureProviderRef<PostalCode> ref, PostalCode postalCode) async {
  final _postalCodeRepository = ref.read(postalCodeRepositoryProvider);

  if (postalCode.code.length != 7) {
    throw Exception("Postal Code must be 7 characters");
  }

  return await _postalCodeRepository.search(postalCode);
}
