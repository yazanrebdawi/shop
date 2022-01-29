// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constant.dart';

class CoustomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: firstbackcolor,
      actions: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width * .07,
        ),
        IconButton(
            icon: Icon(
              Icons.add_circle_sharp,
            ),
            onPressed: () {
              Get.offNamed('/AddProdect');
            }),
        SizedBox(
          width: MediaQuery.of(context).size.width * .1,
        ),
        IconButton(
            icon: Icon(Icons.home_outlined),
            onPressed: () {
              Get.offNamed('/HomePage');
            }),
        SizedBox(
          width: MediaQuery.of(context).size.width * .1,
        ),
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
        SizedBox(
          width: MediaQuery.of(context).size.width * .1,
        ),
        IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Get.offAllNamed('/Landing');
            }),
        SizedBox(
          width: MediaQuery.of(context).size.width * .07,
        ),
      ],
    );
  }
}
