// To parse this JSON data, do
//
//     final complexModel = complexModelFromJson(jsonString);

import 'dart:convert';

ComplexModel complexModelFromJson(String str) =>
    ComplexModel.fromJson(json.decode(str));

String complexModelToJson(ComplexModel data) => json.encode(data.toJson());

class ComplexModel {
  bool success;
  String message;
  List<Datum> data;

  ComplexModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ComplexModel.fromJson(Map<String, dynamic> json) => ComplexModel(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String id;
  bool onSale;
  int salePercent;
  int sold;
  bool sliderNew;
  bool sliderRecent;
  bool sliderSold;
  String date;
  String title;
  Categories categories;
  Categories subcat;
  Shop shop;
  String price;
  String saleTitle;
  String salePrice;
  String description;
  String color;
  String size;
  bool inWishlist;
  List<Image> images;

  Datum({
    required this.id,
    required this.onSale,
    required this.salePercent,
    required this.sold,
    required this.sliderNew,
    required this.sliderRecent,
    required this.sliderSold,
    required this.date,
    required this.title,
    required this.categories,
    required this.subcat,
    required this.shop,
    required this.price,
    required this.saleTitle,
    required this.salePrice,
    required this.description,
    required this.color,
    required this.size,
    required this.inWishlist,
    required this.images,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        onSale: json["on_sale"],
        salePercent: json["sale_percent"],
        sold: json["sold"],
        sliderNew: json["slider_new"],
        sliderRecent: json["slider_recent"],
        sliderSold: json["slider_sold"],
        date: json["date"],
        title: json["title"],
        categories: Categories.fromJson(json["categories"]),
        subcat: Categories.fromJson(json["subcat"]),
        shop: Shop.fromJson(json["shop"]),
        price: json["price"],
        saleTitle: json["sale_title"],
        salePrice: json["sale_price"],
        description: json["description"],
        color: json["color"],
        size: json["size"],
        inWishlist: json["in_wishlist"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "on_sale": onSale,
        "sale_percent": salePercent,
        "sold": sold,
        "slider_new": sliderNew,
        "slider_recent": sliderRecent,
        "slider_sold": sliderSold,
        "date": date,
        "title": title,
        "categories": categories.toJson(),
        "subcat": subcat.toJson(),
        "shop": shop.toJson(),
        "price": price,
        "sale_title": saleTitle,
        "sale_price": salePrice,
        "description": description,
        "color": color,
        "size": size,
        "in_wishlist": inWishlist,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Categories {
  String id;
  String type;
  int salePercent;
  String date;
  String name;
  String? image;

  Categories({
    required this.id,
    required this.type,
    required this.salePercent,
    required this.date,
    required this.name,
    this.image,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["_id"],
        type: json["type"],
        salePercent: json["sale_percent"],
        date: json["date"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "type": type,
        "sale_percent": salePercent,
        "date": date,
        "name": name,
        "image": image,
      };
}

class Image {
  String id;
  String url;

  Image({
    required this.id,
    required this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
      };
}

class Shop {
  String id;
  bool isActive;
  String createdAt;
  String name;
  String description;
  String shopemail;
  String shopaddress;
  String shopcity;
  String userid;
  String image;

  Shop({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.name,
    required this.description,
    required this.shopemail,
    required this.shopaddress,
    required this.shopcity,
    required this.userid,
    required this.image,
  });

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json["_id"],
        isActive: json["is_active"],
        createdAt: json["created_At"],
        name: json["name"],
        description: json["description"],
        shopemail: json["shopemail"],
        shopaddress: json["shopaddress"],
        shopcity: json["shopcity"],
        userid: json["userid"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "is_active": isActive,
        "created_At": createdAt,
        "name": name,
        "description": description,
        "shopemail": shopemail,
        "shopaddress": shopaddress,
        "shopcity": shopcity,
        "userid": userid,
        "image": image,
      };
}
