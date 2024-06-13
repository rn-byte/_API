import '../models/post_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  Future<List<PostList>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postListFromJson(json);
    } else {
      return null;
    }
  }
}
