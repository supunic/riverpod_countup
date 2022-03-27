import 'package:http/http.dart' as http;
import 'package:riverpod_countup/model/postal_code/postal_code.dart';

abstract class PostalCodeClient {
  Future<String> search(PostalCode postalCode);
}

class PostalCodeClientImpl implements PostalCodeClient {
  @override
  Future<String> search(PostalCode postalCode) async {
    final apiUrl =
        'https://madefor.github.io/postal-code-api/api/v1/${postalCode.upper}/${postalCode.lower}.json';
    final apiUri = Uri.parse(apiUrl);
    http.Response response = await http.get(apiUri);

    if (response.statusCode != 200) {
      throw Exception('No postal code: ${postalCode.code}');
    }

    return response.body;
  }
}
