import 'package:http/http.dart' as http;
import 'package:riverpod_countup/model/postal_code/postal_code.dart';

abstract class PostalCodeClient {
  Future<String> search(PostalCodeInput postalCodeInput);
}

class PostalCodeClientImpl implements PostalCodeClient {
  @override
  Future<String> search(PostalCodeInput postalCodeInput) async {
    final apiUrl =
        'https://madefor.github.io/postal-code-api/api/v1/${postalCodeInput.path}';
    final apiUri = Uri.parse(apiUrl);
    http.Response response = await http.get(apiUri);

    if (response.statusCode != 200) {
      throw Exception('No postal code: ${postalCodeInput.code}');
    }

    return response.body;
  }
}
