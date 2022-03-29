import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/model/postal_code/postal_code.dart';
import 'package:riverpod_countup/notifier/postal_code_input_notifier.dart';
import 'package:riverpod_countup/repository/api/postal_code_client.dart';
import 'package:riverpod_countup/repository/api/postal_code_repository.dart';
import 'package:riverpod_countup/view_model/search_view_model.dart';

final postalCodeInputNotifierProvider =
    StateNotifierProvider<PostalCodeInputNotifier, PostalCodeInput>(
        (_) => PostalCodeInputNotifier());

final postalCodeFutureProvider =
    FutureProvider<PostalCode>(onPostalCodeInputChange);

final postalCodeFutureFamilyProvider =
    AutoDisposeFutureProviderFamily<PostalCode, PostalCodeInput>(
        onPostalCodeInputChangeByFamily);

final postalCodeClientProvider =
    Provider<PostalCodeClient>((_) => PostalCodeClientImpl());

final postalCodeRepositoryProvider = Provider<PostalCodeRepository>(
    (ref) => PostalCodeRepositoryImpl(ref.read(postalCodeClientProvider)));
