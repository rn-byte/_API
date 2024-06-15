import 'package:flutter/material.dart';
import 'package:login_rest_api/services/shop_services.dart';

import '../models/complex_model.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  ComplexModel? complexData;
  List<Datum>? dataList;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var complexData = await ShopServices().getShopList();
    if (complexData != null) {
      setState(() {
        dataList = complexData!.data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: dataList == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: dataList!.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.height * .1,
                    width: MediaQuery.of(context).size.width * .2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              dataList![index].images[index].url.toString())),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
