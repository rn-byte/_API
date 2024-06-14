import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetPhotos extends StatefulWidget {
  const GetPhotos({super.key});

  @override
  State<GetPhotos> createState() => _GetPhotosState();
}

class _GetPhotosState extends State<GetPhotos> {
  List<Photos> photoList = [];

  @override
  void initState() {
    super.initState();
    getPhotos();
  }

  Future<List<Photos>> getPhotos() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photos = Photos(
            albumId: i['albumId'],
            id: i['id'],
            title: i['title'],
            url: i['url'],
            thumbnailUrl: i['thumbnailUrl']);
        photoList.add(photos);
      }
      setState(() {});
      return photoList;
    } else {
      return photoList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          future: getPhotos(),
          builder: (context, AsyncSnapshot<List<Photos>> snapshot) =>
              snapshot.data == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: photoList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(snapshot.data![index].url),
                          ),
                          title: Text(
                            "${snapshot.data![index].id}. ${snapshot.data![index].title}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            snapshot.data![index].albumId.toString(),
                            maxLines: 3,
                            overflow: TextOverflow.fade,
                          ),
                          trailing: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data![index].thumbnailUrl),
                          ),
                        );
                      },
                    ),
        ),
      ),
    );
  }
}

class Photos {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;
  Photos({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });
}
