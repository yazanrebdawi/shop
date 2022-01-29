// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:project/constant.dart';

class CoustemBoutton extends StatelessWidget {
  final double hight, width;
  final String bouttonName;
  final Color? bouttonColer;
  final Color? textBouttonColor;
  final double? textBouttonSize;
  final Function() onTap;

  const CoustemBoutton({
    required this.hight,
    required this.width,
    required this.bouttonName,
    required this.onTap,
    this.bouttonColer,
    this.textBouttonColor,
    this.textBouttonSize,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: hight,
        width: width,
        decoration: BoxDecoration(
          color: bouttonColer ?? white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Text(
          bouttonName,
          style: TextStyle(
            color: textBouttonColor ?? black,
            fontSize: textBouttonSize ?? 30,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
