import 'package:login_rest_api/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserServices {
  Future getUsers() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return usersModelFromJson(json);
    } else {
      return null;
    }
  }
}
