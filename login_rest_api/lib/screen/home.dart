import 'package:flutter/material.dart';

import 'package:login_rest_api/services/remote_services.dart';

import '../models/post_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PostList>? posts;
  @override
  void initState() {
    super.initState();
    getPost();
  }

  getPost() async {
    posts = await RemoteServices().getPosts();
    if (posts != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: posts == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: posts!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      "${posts![index].id}. ${posts![index].title}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      posts![index].body,
                      maxLines: 3,
                      overflow: TextOverflow.fade,
                    ),
                  );
                },
              ),
      ),
    );
  }
}
