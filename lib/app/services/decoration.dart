import 'package:flutter/material.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/text_style_util.dart';

InputDecoration textFormInputDecoration(String hinttext) {
  return InputDecoration(
    hintText: hinttext,
    fillColor: ColorUtil.nTextForm,
    filled: true,
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(20))),
    border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20))),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20))),
  );
}

InputDecoration textformdecorationwithoutborder(
    {String? hint, double radius = 80}) {
  return InputDecoration(
    hintText: hint,
    hintStyle:
        TextStyleUtil.openSans400(fontSize: 14, color: ColorUtil.nblackText),
    fillColor: ColorUtil.whitetText,
    filled: true,
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(radius))),
    border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(radius))),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(radius))),
  );
}
