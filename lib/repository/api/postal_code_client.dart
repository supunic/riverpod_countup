import 'package:http/http.dart' as http;

abstract class PostalCodeClient {
  Future<String> search(String code);
}

class PostalCodeClientImpl implements PostalCodeClient {
  @override
  Future<String> search(String code) async {
    final upper = code.substring(0, 3);
    final lower = code.substring(3);
    final apiUrl =
        'https://madefor.github.io/postal-code-api/api/v1/$upper/$lower.json';
    final apiUri = Uri.parse(apiUrl);
    http.Response response = await http.get(apiUri);

    if (response.statusCode != 200) {
      throw Exception('No postal code: $code');
    }

    return response.body;
  }
}