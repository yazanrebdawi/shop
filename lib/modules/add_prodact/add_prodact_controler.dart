import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/constant.dart';
import 'package:project/models/api_statues.dart';
import 'package:project/models/category.dart';
import 'package:project/models/prodact.dart';
import 'package:project/modules/add_prodact/add_product_service.dart';

class AddProdactControler extends GetxController {
  late Product product;

  bool _loading = false;
  late AddProductService addProductService = new AddProductService();
  List<ListDiscount> listDiscount = [];
  List<Category> listCategory = [];
  var selectedCategory;

  DateTime? selectDate;
  DateTime? selectDate1;
  DateTime? selectDate2;
  DateTime? selectDate3;
  File? image;
  final picker = ImagePicker();
  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  Future<void> getImage(ImageSource src) async {
    // ignore: deprecated_member_use
    final PickedFile = await picker.getImage(source: src);

    if (PickedFile != null) {
      image = File(PickedFile.path);
      //controler.product.image = _image;
    }
    update();
  }

  void goimagePicker(context) {
    var dealog = AlertDialog(
      title: Text('Chose Photo from :'),
      content: Container(
        height: 150,
        child: Column(
          children: [
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Container(
              width: 300,
              color: firstbackcolor,
              child: ListTile(
                leading: Icon(
                  Icons.image,
                  color: white,
                ),
                title: Text(
                  'Gallery',
                  style: TextStyle(color: white, fontSize: 20),
                ),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              color: firstbackcolor,
              child: ListTile(
                leading: Icon(
                  Icons.add_a_photo,
                  color: white,
                ),
                title: Text(
                  'Camera',
                  style: TextStyle(color: white, fontSize: 20),
                ),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (context) {
          return dealog;
        });
    update();
  }

  @override
  void onInit() {
    product = new Product(listDiscounts: listDiscount);
    listDiscount.add(ListDiscount(date: null, discountPercentage: null));
    listDiscount.add(ListDiscount(date: null, discountPercentage: null));
    listDiscount.add(ListDiscount(date: null, discountPercentage: null));
    getCategory();
    super.onInit();
  }

  bool getloading() {
    return _loading;
    update();
  }

  setLoading(bool loading) {
    _loading = loading;
    update();
  }

  getCategory() async {
    setLoading(true);

    var response = await addProductService.getCategory();
    if (response is Success) {
      listCategory = response.response as List<Category>;
      print(listCategory.length);
    }
    if (response is Failure) {
      EasyLoading.showError(response.errorResponse.toString(),
          duration: Duration(seconds: 4), dismissOnTap: true);
    }
    setLoading(false);
    update();
  }

  DateTime? endDate(BuildContext ctx) {
    showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then((value) {
      if (value == null) {
        return null;
      } else {
        return value;
      }
    });
  }

  Future<void> addProduct() async {
    if (product.name == null ||
        product.quantity == null ||
        product.categoryId == null ||
        product.price == null ||
        product.expData == null ||
        product.listDiscounts == null) {
      EasyLoading.showError("the information not completed",
          duration: Duration(seconds: 4), dismissOnTap: true);
    } else {
      product.description = "kkkkk";
      product.imgUrl = "jjj";
      var response = await addProductService.addProduct(product);

      EasyLoading.showSuccess("Product added successfully",
          duration: Duration(seconds: 2), dismissOnTap: true);
    }
  }
}
