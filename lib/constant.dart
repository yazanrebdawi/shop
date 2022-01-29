import 'package:flutter/cupertino.dart';

const Color firstbackcolor = Color(0xffFDCE96);
const Color secondbackcolor = Color(0xffFCAF54);
const Color thiredbackcolor = Color(0xffDB7906);

const Color white = Color(0xffffffff);
const Color black = Color(0xff000000);
const Color yalow = Color(0xffEEEAC4);

const BoxDecoration gradientBackground = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment(-1, -1),
    end: Alignment(1, 1),
    colors: [firstbackcolor, secondbackcolor, thiredbackcolor],
  ),
);
