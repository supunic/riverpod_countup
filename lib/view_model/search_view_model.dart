import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/model/postal_code/postal_code.dart';
import 'package:riverpod_countup/provider/model/postal_code_provider.dart';

class SearchViewModel {
  late final WidgetRef _ref;

  void setRef(WidgetRef ref) {
    _ref = ref;
  }

  PostalCodeInput get _postalCodeInput =>
      _ref.watch(postalCodeInputNotifierProvider);

  AsyncValue<PostalCode> get postalCodeFuture =>
      _ref.watch(postalCodeFutureProvider);

  AsyncValue<PostalCode> get postalCodeFutureFamily =>
      _ref.watch(postalCodeFutureFamilyProvider(_postalCodeInput));

  void onChange(String text) {
    if (text.length != PostalCodeInput.codeLength) return;

    try {
      int.parse(text);
      _ref.read(postalCodeInputNotifierProvider.notifier).update(text);
    } catch (ex) {
      print(ex);
    }
  }
}

Future<PostalCode> onPostalCodeInputChange(
    FutureProviderRef<PostalCode> ref) async {
  // watch した provider の変更を検知する
  final _postalCodeInput = ref.watch(postalCodeInputNotifierProvider);
  final _postalCodeRepository = ref.read(postalCodeRepositoryProvider);

  return await _postalCodeRepository.search(_postalCodeInput);
}

FutureOr<PostalCode> onPostalCodeInputChangeByFamily(
    AutoDisposeFutureProviderRef<PostalCode> ref,
    PostalCodeInput postalCodeInput) async {
  // 引数で渡した値の変更を検知する
  final _postalCodeRepository = ref.read(postalCodeRepositoryProvider);

  return await _postalCodeRepository.search(postalCodeInput);
}
