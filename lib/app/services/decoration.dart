import 'package:flutter/material.dart';
import 'package:noch/app/services/colors.dart';

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
