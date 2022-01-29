import 'package:flutter/material.dart';

import '../constant.dart';

class CoustumeTextFilde extends StatelessWidget {
  final double hight;
  final double width;
  final String hinttext;
  final TextInputType? keybord;
  final Function(String) onChange;
  final Icon? icon;
  // ignore: use_key_in_widget_constructors
  const CoustumeTextFilde(
      {required this.hight,
      required this.width,
      required this.hinttext,
      required this.onChange,
      required this.keybord,
      required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: hight,
      decoration: BoxDecoration(
        color: white.withAlpha(20),
        border: Border(
          bottom: BorderSide(color: white.withAlpha(30), width: 2),
          left: BorderSide(color: white.withAlpha(30), width: 2),
          right: BorderSide(color: white.withAlpha(30), width: 2),
          top: BorderSide(color: white.withAlpha(30), width: 2),
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: TextField(
          onChanged: onChange,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
            prefixIcon: icon ?? null,
            border: InputBorder.none,
            hintText: hinttext,
            hintStyle: const TextStyle(
              fontSize: 20,
              color: white,
            ),
          ),
          cursorColor: white,
          keyboardType: keybord ?? TextInputType.text,
          style: const TextStyle(
            fontSize: 20,
            color: white,
          ),
        ),
      ),
    );
  }
}
