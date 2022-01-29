// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(
    json.decode(str)["data"].map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.id,
    this.name,
    this.price,
    this.description,
    this.expData,
    this.imgUrl,
    this.quantity,
    this.categoryId,
    this.listDiscounts,
    this.user_id,
  });

  int? id;
  String? name;
  int? price;
  String? description;
  String? expData;
  String? imgUrl;
  int? quantity;
  int? categoryId;
  List<ListDiscount>? listDiscounts;
  int? user_id;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        price: json["price"] == null ? null : json["price"],
        description: json["description"] == null ? null : json["description"],
        expData: json["exp_data"] == null ? null : json["exp_data"],
        imgUrl: json["img_url"] == null ? null : json["img_url"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        user_id: json["user_id"] == null ? null : json["user_id"],
        listDiscounts: json["list_discounts"] == null
            ? null
            : List<ListDiscount>.from(
                json["list_discounts"].map((x) => ListDiscount.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "price": price == null ? null : price,
        "description": description == null ? null : description,
        "exp_data": expData == null ? null : expData,
        "img_url": imgUrl == null ? null : imgUrl,
        "quantity": quantity == null ? null : quantity,
        "category_id": categoryId == null ? null : categoryId,
        "user_id": user_id == null ? null : user_id,
        "list_discounts": listDiscounts == null
            ? null
            : List<dynamic>.from(listDiscounts!.map((x) => x.toJson())),
      };
}

String ListDiscountToJson(List<ListDiscount> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListDiscount {
  ListDiscount({
    this.date,
    this.discountPercentage,
  });

  String? date;
  int? discountPercentage;

  factory ListDiscount.fromJson(Map<String, dynamic> json) => ListDiscount(
        date: json["date"] == null ? null : json["date"],
        discountPercentage: json["discount_percentage"] == null
            ? null
            : json["discount_percentage"],
      );

  Map<String, dynamic> toJson() => {
        "date": date == null ? null : date,
        "discount_percentage":
            discountPercentage == null ? null : discountPercentage,
      };
}
