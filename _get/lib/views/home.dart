import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic>? dataMap;
  Map<String, dynamic>? doneDataMap;
  @override
  void initState() {
    super.initState();
    hitApi();
  }

  Future hitApi() async {
    http.Response response;
    var uri = Uri.parse('https://reqres.in/api/users/2');
    response = await http.get(uri);
    if (response.statusCode == 200) {
      setState(() {
        dataMap = jsonDecode(response.body);
        doneDataMap = dataMap!['data'];
        print(doneDataMap);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GET API'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(9.0),
        child: Center(
          child: ListTile(
            leading: Image(image: NetworkImage(doneDataMap!["avatar"])),
            title: Text(
                '${doneDataMap!['first_name']} ${doneDataMap!['last_name']}'),
            subtitle: Text(doneDataMap!['email']),
            trailing: Text(doneDataMap!['id'].toString()),
          ),
        ),
      ),
    );
  }
}
