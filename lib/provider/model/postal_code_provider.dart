import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/model/postal_code/postal_code.dart';
import 'package:riverpod_countup/repository/api/postal_code_client.dart';
import 'package:riverpod_countup/repository/api/postal_code_repository_impl.dart';
import 'package:riverpod_countup/view_model/search_view_model.dart';

final postalCodeProvider =
    StateProvider<PostalCode>((_) => const PostalCode(code: '', data: []));

final postalCodeFutureProvider = FutureProvider<PostalCode>(onPostalCodeChange);

final postalCodeFutureFamilyProvider =
    FutureProviderFamily<PostalCode, PostalCode>(onPostalCodeChangeByFamily);

final postalCodeClientProvider =
    Provider<PostalCodeClient>((_) => PostalCodeClientImpl());

final postalCodeRepositoryProvider = Provider<PostalCodeRepository>(
    (ref) => PostalCodeRepositoryImpl(ref.read(postalCodeClientProvider)));
