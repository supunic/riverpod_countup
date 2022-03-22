import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/postal_code/postal_code.dart';
import '../../model/postal_code/postal_code_repository.dart';

class PostalCodeClient implements PostalCodeRepository {
  @override
  Future<PostalCode> search(String postalCode) async {
    final upper = postalCode.substring(0, 3);
    final lower = postalCode.substring(3);
    final apiUrl =
        'https://madefor.github.io/postal-code-api/api/v1/$upper/$lower.json';
    final apiUri = Uri.parse(apiUrl);
    http.Response response = await http.get(apiUri);

    if (response.statusCode != 200) {
      throw Exception('No postal code: $postalCode');
    }

    var jsonData = json.decode(response.body);
    return PostalCode.fromJson(jsonData);
  }
}