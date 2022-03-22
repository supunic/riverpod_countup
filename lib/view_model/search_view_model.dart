import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/service/postal_code_service.dart';

import '../model/postal_code/postal_code.dart';
import '../provider/model/postal_code_provider.dart';
import '../repository/api/postal_code_client.dart';

class SearchViewModel {
  // TODO DI
  final PostalCodeClient _postalCodeClient = PostalCodeClient();
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

  Future<PostalCode> onPostalCodeChange(
      FutureProviderRef<PostalCode> ref) async {
    final newPostalCode = ref.watch(postalCodeProvider);
    if (newPostalCode.code.length != 7) {
      throw Exception("Postal Code must be 7 characters");
    }
    var response = await _postalCodeClient.search(newPostalCode.code);
    var jsonData = json.decode(response.body);
    return PostalCode.fromJson(jsonData);
  }

  Future<PostalCode> onPostalCodeChangeByFamily(
      AutoDisposeFutureProviderRef<PostalCode> ref, String postalCode) async {
    if (postalCode.length != 7) {
      throw Exception("Postal Code must be 7 characters");
    }
    var response = await _postalCodeClient.search(postalCode);
    var jsonData = json.decode(response.body);
    return PostalCode.fromJson(jsonData);
  }
}
