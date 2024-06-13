import 'package:flutter/material.dart';

import 'package:login_rest_api/services/remote_services.dart';

import '../models/post_model.dart';
import 'get_photos.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  List<PostList>? posts;
  PageController pageController = PageController();
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

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: PageView(
        controller: pageController,
        children: [
          _containerPost(),
          const GetPhotos(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.get_app), label: 'Get'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
          //BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.indigo,
        //backgroundColor: Colors.blue,
        currentIndex: selectedIndex,
        onTap: onTapped,
        showUnselectedLabels: true,
        //elevation: 10,
      ),
    );
  }

  Container _containerPost() {
    return Container(
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
    );
  }
}
