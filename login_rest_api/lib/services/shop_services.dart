import 'package:http/http.dart' as http;
import 'package:login_rest_api/models/complex_model.dart';

class ShopServices {
  Future getShopList() async {
    var client = http.Client();
    var uri =
        Uri.parse('https://webhook.site/32d95c42-8d2d-43e9-a5ef-db9a47a79b03');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return complexModelFromJson(json.toString());
    } else {
      return null;
    }
  }
}
