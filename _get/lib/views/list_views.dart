import 'package:_get/models/get_list_model.dart';
import 'package:_get/services/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListviewScreen extends StatefulWidget {
  const ListviewScreen({super.key});
  @override
  State<ListviewScreen> createState() => _ListviewScreenState();
}

class _ListviewScreenState extends State<ListviewScreen> {
  GetList? getList;
  List<Datum>? getData;
  @override
  void initState() {
    super.initState();
    getDataList();
  }

  getDataList() async {
    getList = await GetService().getApiList();
    if (getList != null) {
      setState(() {
        getData = getList!.data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GET API List'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: getData?.length,
        itemBuilder: (context, index) {
          return getData == null
              ? const CupertinoActivityIndicator()
              : ListTile(
                  leading: Text(getData![index].id.toString()),
                  title: Text(
                      "${getData![index].firstName} ${getData![index].lastName}"),
                  subtitle: Text(getData![index].email),
                  trailing: Image(image: NetworkImage(getData![index].avatar)),
                );
        },
      ),
    );
  }
}
