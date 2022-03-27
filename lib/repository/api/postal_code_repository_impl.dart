import 'dart:convert';

import 'package:riverpod_countup/model/postal_code/postal_code.dart';
import 'package:riverpod_countup/repository/api/postal_code_client.dart';

class PostalCodeRepositoryImpl implements PostalCodeRepository {
  PostalCodeRepositoryImpl(this._postalCodeClient);

  final PostalCodeClient _postalCodeClient;

  @override
  Future<PostalCode> search(PostalCode postalCode) async {
    final responseBody = await _postalCodeClient.search(postalCode);
    final jsonData = json.decode(responseBody);

    return PostalCode.fromJson(jsonData);
  }
}
