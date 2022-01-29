// ignore_for_file: must_be_immutable, deprecated_member_use, unused_field

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/compenet/coustome_appbar.dart';
import 'package:project/compenet/coustome_button.dart';
import 'package:project/compenet/coustome_text_filde.dart';
import 'package:project/constant.dart';
import 'package:project/models/category.dart';
import 'package:project/models/prodact.dart';

import 'add_prodact_controler.dart';

class AddProdact extends StatelessWidget {
  AddProdactControler controler = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: CoustomeAppBar(), preferredSize: Size.fromHeight(50)),
        body: GetBuilder<AddProdactControler>(builder: (controller) {
          return controller.getloading() == false
              ? SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: gradientBackground,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 215,
                            width: 215,
                            child: Stack(
                              fit: StackFit.passthrough,
                              clipBehavior: Clip.none,
                              children: [
                                CircleAvatar(
                                  backgroundColor: white,
                                  backgroundImage: controller.image == null
                                      ? AssetImage("assets/images/logo.png")
                                      : Image.file(controller.image!).image,
                                ),
                                Positioned(
                                  right: -16,
                                  bottom: 0,
                                  child: SizedBox(
                                    height: 46,
                                    width: 46,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          side: BorderSide(color: Colors.white),
                                        ),
                                        primary: Colors.white,
                                        backgroundColor: firstbackcolor,
                                      ),
                                      onPressed: () {
                                        controller.goimagePicker(context);
                                      },
                                      child: Icon(Icons.add_a_photo),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CoustumeTextFilde(
                            icon: Icon(null),
                            hight: 60,
                            width: MediaQuery.of(context).size.width * 0.9,
                            hinttext: 'Name Prodact',
                            keybord: TextInputType.name,
                            onChange: (Value) {
                              controller.product.name = Value;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CoustumeTextFilde(
                            icon: Icon(null),
                            hight: 60,
                            width: MediaQuery.of(context).size.width * 0.9,
                            hinttext: 'Number of Pices',
                            keybord: TextInputType.number,
                            onChange: (Value) {
                              controller.product.quantity = int.parse(Value);
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 60,
                            decoration: BoxDecoration(
                              color: white.withAlpha(20),
                              border: Border(
                                bottom: BorderSide(
                                    color: white.withAlpha(30), width: 2),
                                left: BorderSide(
                                    color: white.withAlpha(30), width: 2),
                                right: BorderSide(
                                    color: white.withAlpha(30), width: 2),
                                top: BorderSide(
                                    color: white.withAlpha(30), width: 2),
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DropdownButton(
                                  value: controller.selectedCategory,
                                  hint: Text(
                                    controller.selectedCategory == null
                                        ? 'Select Category'
                                        : controller.selectedCategory,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: white,
                                    ),
                                  ),
                                  icon: const Icon(Icons.keyboard_arrow_down),

                                  // Array list of items
                                  items: controller.listCategory.map((items) {
                                    return DropdownMenuItem(
                                      value: items.id,
                                      child: Text(items.name.toString()),
                                    );
                                  }).toList(),

                                  onChanged: (newValue) {
                                    controller.product.categoryId =
                                        int.parse(newValue.toString());
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CoustumeTextFilde(
                            icon: Icon(null),
                            hight: 60,
                            width: MediaQuery.of(context).size.width * 0.9,
                            hinttext: 'Price',
                            keybord: TextInputType.number,
                            onChange: (Value) {
                              controller.product.price = int.parse(Value);
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Price with sale',
                            style: TextStyle(color: white, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CoustumeTextFilde(
                                icon: null,
                                hight: 40,
                                width: MediaQuery.of(context).size.width * 0.25,
                                hinttext: '30%',
                                keybord: TextInputType.number,
                                onChange: (Value) {
                                  controller.product.listDiscounts!
                                      .elementAt(0)
                                      .discountPercentage = int.parse(Value);
                                },
                              ),
                              CoustemBoutton(
                                  hight: 60,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  bouttonName: controller.product.listDiscounts!
                                              .elementAt(0)
                                              .date ==
                                          null
                                      ? 'Select Date'
                                      : controller.product.listDiscounts!
                                          .elementAt(0)
                                          .date
                                          .toString()
                                          .substring(0, 10),
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2025),
                                    ).then((value) {
                                      if (value == null) {
                                        return null;
                                      } else {
                                        controller.product.listDiscounts!
                                            .elementAt(0)
                                            .date = value.toString();
                                      }
                                    });
                                  })
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CoustumeTextFilde(
                                icon: null,
                                hight: 40,
                                width: MediaQuery.of(context).size.width * 0.25,
                                hinttext: '50%',
                                keybord: TextInputType.number,
                                onChange: (Value) {
                                  controller.product.listDiscounts!
                                      .elementAt(1)
                                      .discountPercentage = int.parse(Value);
                                },
                              ),
                              CoustemBoutton(
                                  hight: 60,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  bouttonName: controller.product.listDiscounts!
                                              .elementAt(1)
                                              .date ==
                                          null
                                      ? 'Select Date'
                                      : controller.product.listDiscounts!
                                          .elementAt(1)
                                          .date
                                          .toString()
                                          .substring(0, 10),
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2025),
                                    ).then((value) {
                                      if (value == null) {
                                        return null;
                                      } else {
                                        controller.product.listDiscounts!
                                            .elementAt(1)
                                            .date = value.toString();
                                        ;
                                      }
                                    });
                                  })
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CoustumeTextFilde(
                                icon: null,
                                hight: 40,
                                width: MediaQuery.of(context).size.width * 0.25,
                                hinttext: '70%',
                                keybord: TextInputType.number,
                                onChange: (Value) {
                                  controller.product.listDiscounts!
                                      .elementAt(2)
                                      .discountPercentage = int.parse(Value);
                                },
                              ),
                              CoustemBoutton(
                                  hight: 60,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  bouttonName: controller.product.listDiscounts!
                                              .elementAt(2)
                                              .date ==
                                          null
                                      ? 'Select Date'
                                      : controller.product.listDiscounts!
                                          .elementAt(2)
                                          .date
                                          .toString()
                                          .substring(0, 10),
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2025),
                                    ).then((value) {
                                      if (value == null) {
                                        return null;
                                      } else {
                                        controller.product.listDiscounts!
                                            .elementAt(2)
                                            .date = value.toString();
                                        ;
                                      }
                                    });
                                  })
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CoustemBoutton(
                            hight: 60,
                            width: MediaQuery.of(context).size.width * 0.87,
                            bouttonName: controller.product.expData == null
                                ? 'Select End Date'
                                : controller.product.expData
                                    .toString()
                                    .substring(0, 10),
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2025),
                              ).then((value) {
                                if (value == null) {
                                  return null;
                                } else {
                                  controller.product.expData = value.toString();
                                }
                              });
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CoustemBoutton(
                            hight: 60,
                            bouttonColer: yalow,
                            width: MediaQuery.of(context).size.width * 0.87,
                            bouttonName: 'Add Prodact',
                            onTap: () {
                              controller.addProduct();
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator());
        }));
  }
}
