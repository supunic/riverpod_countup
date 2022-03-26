import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/model/postal_code/postal_code.dart';
import 'package:riverpod_countup/notifier/postal_code_notifier.dart';
import 'package:riverpod_countup/repository/api/postal_code_client.dart';
import 'package:riverpod_countup/repository/api/postal_code_repository_impl.dart';
import 'package:riverpod_countup/view_model/search_view_model.dart';

final postalCodeNotifierProvider =
    StateNotifierProvider<PostalCodeNotifier, PostalCode>(
        (_) => PostalCodeNotifier());

final postalCodeFutureProvider = FutureProvider<PostalCode>(onPostalCodeChange);

final postalCodeFutureFamilyProvider =
    AutoDisposeFutureProviderFamily<PostalCode, PostalCode>(
        onPostalCodeChangeByFamily);

final postalCodeClientProvider =
    Provider<PostalCodeClient>((_) => PostalCodeClientImpl());

final postalCodeRepositoryProvider = Provider<PostalCodeRepository>(
    (ref) => PostalCodeRepositoryImpl(ref.read(postalCodeClientProvider)));
