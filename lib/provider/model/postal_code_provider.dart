import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/postal_code/postal_code.dart';
import '../../view_model/search_view_model.dart';

final SearchViewModel _searchViewModel = SearchViewModel();

final postalCodeProvider =
    StateProvider<PostalCode>((ref) => const PostalCode(code: '', data: []));

final postalCodeFutureProvider =
    FutureProvider<PostalCode>(_searchViewModel.onPostalCodeChange);

final postalCodeFutureFamilyProvider =
    AutoDisposeFutureProviderFamily<PostalCode, String>(
        _searchViewModel.onPostalCodeChangeByFamily);
