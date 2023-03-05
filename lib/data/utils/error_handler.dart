
import 'package:http/http.dart' as http;

bool httpErrorHandle({
  required http.Response response,
  bool dialog = false
}) {
  switch (response.statusCode) {
    case 200:
      return true;
    case 401:
      return false;
    default:
      return false;
  }
}