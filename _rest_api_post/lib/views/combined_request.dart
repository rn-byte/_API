import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CombinedRequestDemo extends StatefulWidget {
  const CombinedRequestDemo({super.key});

  @override
  State<CombinedRequestDemo> createState() => _CombinedRequestDemoState();
}

class _CombinedRequestDemoState extends State<CombinedRequestDemo> {
  var data = 'Demo Data';

  Future<void> getData() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    if (response.statusCode == 200) {
      setState(() {
        data = response.body;
      });
    } else {
      setState(() {
        data = 'Error fetching Data';
      });
    }
  }

  Future<void> createData() async {
    var response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/'),
      body: {
        'title': 'Hello Buddy! How are You',
        'body': 'I am Fine .',
        'id': '1'
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      setState(() {
        data = response.body;
      });
    } else {
      setState(() {
        data = 'Error Creating Data';
      });
    }
  }

  Future<void> deleteData() async {
    var response = await http.delete(
      Uri.parse('https://reqres.in/api/users/2'),
    );
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 204) {
      setState(() {
        data = 'Data Deleted Successfully';
      });
    } else {
      setState(() {
        data = 'Error Deleting Data';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP Request In Flutter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: getData, child: const Text('Get Request')),
                ElevatedButton(
                    onPressed: createData, child: const Text('Post Request')),
                ElevatedButton(
                    onPressed: deleteData, child: const Text('Delete Request')),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Text(data),
            )),
          ],
        ),
      ),
    );
  }
}
