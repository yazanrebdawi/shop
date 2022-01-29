// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/compenet/coustome_appbar.dart';
import 'package:project/compenet/prodact_card.dart';
import 'package:project/constant.dart';
import 'package:project/modules/home_page/home_page_controler.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomePageControler controler = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CoustomeAppBar(),
        preferredSize: Size.fromHeight(50),
      ),
      body: SafeArea(
        child: GetBuilder<HomePageControler>(
            builder: (controlller) => SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: gradientBackground,
                        child: GridView.count(
                          physics: ClampingScrollPhysics(),
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          children: List.generate(
                              controlller.productList.length, (index) {
                            return ProdactCard(
                                name: controlller.productList[index].name
                                    .toString(),
                                imagUrl: 'assets/images/orange.png',
                                onTap: () {
                                  Get.toNamed('/Details', arguments: {
                                    'id': controlller.productList[index].id
                                  });
                                });
                          }),
                        ),
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}
