import 'package:_get/models/get.dart';
import 'package:_get/models/get_list_model.dart';
import 'package:http/http.dart' as http;

class GetService {
  Future hitApi() async {
    http.Response response;
    var uri = Uri.parse('https://reqres.in/api/users/2');
    response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return getFromJson(json);
    }
  }

  Future getApiList() async {
    http.Response response;
    var uri = Uri.parse('https://reqres.in/api/users?page=2');
    response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return getListFromJson(json);
    }
  }
}
