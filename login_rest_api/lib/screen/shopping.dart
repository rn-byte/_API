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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(dataList![index].shop.image),
                          ),
                          title: Text(dataList![index].shop.name),
                          subtitle: Text(dataList![index].shop.shopemail),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .5,
                          width: MediaQuery.of(context).size.width * 1,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: dataList![index].images.length,
                            itemBuilder: (context, position) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .25,
                                  width: MediaQuery.of(context).size.width * .5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(dataList![index]
                                            .images[position]
                                            .url
                                            .toString())),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Icon(dataList![index].inWishlist == false
                            ? Icons.favorite
                            : Icons.favorite_outline),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
