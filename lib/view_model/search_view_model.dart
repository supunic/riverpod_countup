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
    if (text.length != PostalCode.codeLength) return;

    try {
      int.parse(text); // 数字であるか確認
      _ref.read(postalCodeNotifierProvider.notifier).updateCode(text);
    } catch (ex) {
      print(ex);
    }
  }
}

Future<PostalCode> onPostalCodeChange(FutureProviderRef<PostalCode> ref) async {
  final _newPostalCode = ref.watch(postalCodeNotifierProvider);
  final _postalCodeRepository = ref.read(postalCodeRepositoryProvider);

  return await _postalCodeRepository.search(_newPostalCode);
}

FutureOr<PostalCode> onPostalCodeChangeByFamily(
    AutoDisposeFutureProviderRef<PostalCode> ref, PostalCode postalCode) async {
  final _postalCodeRepository = ref.read(postalCodeRepositoryProvider);

  return await _postalCodeRepository.search(postalCode);
}
