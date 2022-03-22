import 'package:http/http.dart' as http;

abstract class PostalCodeClient {
  Future<String> search(String postalCode);
}

class PostalCodeClientImpl implements PostalCodeClient {
  @override
  Future<String> search(String postalCode) async {
    final upper = postalCode.substring(0, 3);
    final lower = postalCode.substring(3);
    final apiUrl =
        'https://madefor.github.io/postal-code-api/api/v1/$upper/$lower.json';
    final apiUri = Uri.parse(apiUrl);
    http.Response response = await http.get(apiUri);

    if (response.statusCode != 200) {
      throw Exception('No postal code: $postalCode');
    }

    return response.body;
  }
}