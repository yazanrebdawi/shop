import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/compenet/coustome_button.dart';

class CoustomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: <Widget>[
        DrawerHeader(
          child: SizedBox(),
        ),
        CoustemBoutton(
          hight: 60,
          width: MediaQuery.of(context).size.width * .2,
          bouttonName: 'Home',
          onTap: () {
            Get.toNamed('/HomePage');
          },
        ),
        SizedBox(
          height: 20,
        ),
        CoustemBoutton(
            hight: 60,
            width: MediaQuery.of(context).size.width * .2,
            bouttonName: 'Add Prodact',
            onTap: () {
              Get.toNamed('/AddProdect');
            }),
        SizedBox(
          height: 20,
        ),
        CoustemBoutton(
            hight: 60,
            width: MediaQuery.of(context).size.width * .2,
            bouttonName: 'Sign Out',
            onTap: () {
              Get.offAllNamed('/Landing');
            })
      ],
    );
  }
}
