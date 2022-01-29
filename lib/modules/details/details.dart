import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project/constant.dart';
import 'package:project/modules/details/details_controller.dart';
import 'package:project/modules/splash/splash.dart';

class ProductDetail extends StatelessWidget {
  DetailController controler = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<DetailController>(builder: (controller) {
      return controller.getloading() == false
          ? Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .37,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/orange.png"),
                    fit: BoxFit.cover,
                  )),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .6,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(0, -4),
                            blurRadius: 0,
                          )
                        ]),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 30,
                              right: 30,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(controller.product.name!,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                      )),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ListTile(
                            leading: Icon(Icons.tab),
                            title: Text('Type',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(controller.category.name.toString()),
                                SizedBox(width: 3),
                                Icon(Icons.tab_unselected),
                              ],
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.money,
                            ),
                            title: Text('price',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(controller.product.price.toString()),
                                Icon(Icons.attach_money),
                              ],
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.date_range,
                            ),
                            title: Text('EndDate',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(controller.product.expData
                                    .toString()
                                    .substring(0, 10)),
                                SizedBox(width: 3),
                                Icon(Icons.data_saver_off),
                              ],
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.multiline_chart),
                            title: Text('Pices',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(controller.product.quantity.toString()),
                                SizedBox(width: 3),
                                Icon(Icons.yard),
                              ],
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.phone_android),
                            title: Text('phoneNumb',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('0997686585'),
                                Icon(Icons.phone_callback),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox.fromSize(
                            size: Size(56, 56), // button width and height
                            child: ClipOval(
                              child: Material(
                                color: firstbackcolor, // button color
                                child: InkWell(
                                  splashColor: white, // splash color
                                  onTap: () {}, // button pressed
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.call), // icon
                                      Text("Call"), // text
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          : Center(child: CircularProgressIndicator());
    }));
  }
}
