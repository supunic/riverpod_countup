import 'package:riverpod_countup/model/postal_code/postal_code.dart';

class PostalCodeService {
  PostalCode _postalCode = const PostalCode(code: '', data: []);

  get postalCode => _postalCode;

  void updateCode(String code) {
    _postalCode = _postalCode.copyWith(code: code);
  }

  void reset() {
    _postalCode = const PostalCode(code: '', data: []);
  }
}
