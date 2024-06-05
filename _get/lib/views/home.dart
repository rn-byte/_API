import 'package:_get/models/get.dart';
import 'package:_get/services/service.dart';
import 'package:_get/views/list_views.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Get? get;
  Data? getData;

  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    hitAPI();
  }

  hitAPI() async {
    get = await GetService().hitApi();

    if (get != null) {
      setState(() {
        getData = get!.data;
        isLoaded = true;
        //print(getData);
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListviewScreen(),
                  )),
              child: const Icon(
                Icons.arrow_forward_ios_sharp,
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(9.0),
        child: Visibility(
          visible: isLoaded,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: getData == null
              ? const CircularProgressIndicator()
              : ListTile(
                  leading: Image(image: NetworkImage(getData!.avatar)),
                  title: Text('${getData!.firstName} ${getData!.lastName}'),
                  subtitle: Text(getData!.email),
                  trailing: Text(getData!.id.toString()),
                ),
        ),
      ),
    );
  }
}
