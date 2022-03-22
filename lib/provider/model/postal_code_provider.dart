import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/repository/api/postal_code_client.dart';
import 'package:riverpod_countup/repository/api/postal_code_repository_impl.dart';

import '../../model/postal_code/postal_code.dart';
import '../../view_model/search_view_model.dart';

final SearchViewModel _searchViewModel = SearchViewModel();

final postalCodeProvider =
    StateProvider<PostalCode>((_) => const PostalCode(code: '', data: []));

final postalCodeFutureProvider =
    FutureProvider<PostalCode>(_searchViewModel.onPostalCodeChange);

final postalCodeFutureFamilyProvider =
    AutoDisposeFutureProviderFamily<PostalCode, String>(
        _searchViewModel.onPostalCodeChangeByFamily);

final postalCodeClientProvider =
    Provider<PostalCodeClient>((_) => PostalCodeClientImpl());

final postalCodeRepositoryProvider = Provider<PostalCodeRepository>(
    (ref) => PostalCodeRepositoryImpl(ref.read(postalCodeClientProvider)));
