import 'dart:convert';

import 'package:riverpod_countup/repository/api/postal_code_client.dart';

import '../../model/postal_code/postal_code.dart';

class PostalCodeRepositoryImpl implements PostalCodeRepository {
  PostalCodeRepositoryImpl(this._postalCodeClient);

  final PostalCodeClient _postalCodeClient;

  @override
  Future<PostalCode> search(String postalCode) async {
    final responseBody = await _postalCodeClient.search(postalCode);
    var jsonData = json.decode(responseBody);
    return PostalCode.fromJson(jsonData);
  }
}