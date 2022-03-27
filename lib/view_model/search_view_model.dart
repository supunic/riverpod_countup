import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/model/postal_code/postal_code.dart';
import 'package:riverpod_countup/notifier/postal_code_input_notifier.dart';
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

  PostalCodeInputNotifier get _postalCodeInputNotifier =>
      _ref.read(postalCodeInputNotifierProvider.notifier);

  void onChange(String text) {
    if (!_postalCodeInputNotifier.isMatchTextLength(text)) return;

    try {
      int.parse(text);
      _postalCodeInputNotifier.update(text);
    } catch (ex) {
      print(ex);
    }
  }
}

Future<PostalCode> onPostalCodeInputChange(
    FutureProviderRef<PostalCode> ref) async {
  // watch した provider の変更を検知する
  final postalCodeInput = ref.watch(postalCodeInputNotifierProvider);
  final postalCodeRepository = ref.read(postalCodeRepositoryProvider);
  final postalCodeInputNotifier =
      ref.read(postalCodeInputNotifierProvider.notifier);

  if (!postalCodeInputNotifier.isFilled()) {
    return PostalCode.empty();
  }

  return await postalCodeRepository.search(postalCodeInput);
}

FutureOr<PostalCode> onPostalCodeInputChangeByFamily(
    AutoDisposeFutureProviderRef<PostalCode> ref,
    PostalCodeInput postalCodeInput) async {
  // 引数で渡した値の変更を検知する
  final postalCodeRepository = ref.read(postalCodeRepositoryProvider);
  final postalCodeInputNotifier =
      ref.read(postalCodeInputNotifierProvider.notifier);

  if (!postalCodeInputNotifier.isFilled()) {
    return PostalCode.empty();
  }

  return await postalCodeRepository.search(postalCodeInput);
}
