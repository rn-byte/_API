import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class DropdownViewDemo extends StatefulWidget {
  const DropdownViewDemo({super.key});

  @override
  State<DropdownViewDemo> createState() => _DropdownViewDemoState();
}

class _DropdownViewDemoState extends State<DropdownViewDemo> {
  late var selectedValue;
  List<Post>? posts;
  @override
  void initState() {
    super.initState();
    // getData();
  }

  Future<List<Post>> getData() async {
    // posts = await RemoteService().getPosts();
    // if (posts != null) {
    //   setState(() {});
    // }
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      final body = jsonDecode(response.body) as List;
      if (response.statusCode == 200) {
        return body.map(
          (e) {
            final map = e as Map<String, dynamic>;
            return Post(
              userId: map['userId'],
              id: map['id'],
              title: map['title'],
              body: map['body'],
            );
          },
        ).toList();
      }
    } on SocketException {
      throw Exception('NO INTERNET CONNECTION');
    }
    throw Exception('ERROR FETCHING DATA');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DropDownList Demo'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder<List<Post>>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButton(
                  value: selectedValue,
                  isExpanded: true,
                  hint: const Text('Select Value'),
                  items: snapshot.data!.map(
                    (e) {
                      return DropdownMenuItem(
                        value: e.id.toString(),
                        child: Text(e.id.toString()),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    selectedValue = value.toString();
                    setState(() {});
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
