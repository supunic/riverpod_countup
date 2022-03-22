import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/model/postal_code/postal_code.dart';
import 'package:riverpod_countup/provider/model/postal_code_provider.dart';
import 'package:riverpod_countup/service/postal_code_service.dart';

class SearchViewModel {
  final PostalCodeService _postalCodeService = PostalCodeService();

  late WidgetRef _ref;

  void setRef(WidgetRef ref) {
    _ref = ref;
  }

  PostalCode get postalCode => _ref.watch(postalCodeProvider);

  AsyncValue<PostalCode> get postalCodeFuture =>
      _ref.watch(postalCodeFutureProvider);

  AsyncValue<PostalCode> get postalCodeFutureFamily =>
      _ref.watch(postalCodeFutureFamilyProvider(postalCode.code));

  void onChange(String text) {
    if (text.length != 7) {
      return;
    }

    try {
      int.parse(text);
      _postalCodeService.updateCode(text);
      _ref
          .watch(postalCodeProvider.state)
          .update((state) => _postalCodeService.postalCode);
    } catch (ex) {}
  }
}

Future<PostalCode> onPostalCodeChange(FutureProviderRef<PostalCode> ref) async {
  final _newPostalCode = ref.watch(postalCodeProvider);
  final _postalCodeRepository = ref.read(postalCodeRepositoryProvider);

  if (_newPostalCode.code.length != 7) {
    throw Exception("Postal Code must be 7 characters");
  }

  return await _postalCodeRepository.search(_newPostalCode.code);
}

Future<PostalCode> onPostalCodeChangeByFamily(
    AutoDisposeFutureProviderRef<PostalCode> ref, String postalCode) async {
  final _postalCodeRepository = ref.read(postalCodeRepositoryProvider);

  if (postalCode.length != 7) {
    throw Exception("Postal Code must be 7 characters");
  }

  return await _postalCodeRepository.search(postalCode);
}
