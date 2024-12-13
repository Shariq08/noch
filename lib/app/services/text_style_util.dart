import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noch/app/services/colors.dart';

class TextStyleUtil {
  static TextStyle nTitle({
    Color color = Colors.white,
  }) {
    return GoogleFonts.openSans(
      color: color,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle nsubTitle({
    Color color = Colors.white,
  }) {
    return GoogleFonts.openSans(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle openSans600(
      {Color color = ColorUtil.whitetText,
      double fontSize = 14,
      FontStyle fontStyle = FontStyle.normal}) {
    return GoogleFonts.openSans(
      fontStyle: fontStyle,
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle openSans700(
      {Color color = ColorUtil.whitetText, double fontSize = 32}) {
    return GoogleFonts.openSans(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle openSans400(
      {Color color = ColorUtil.whitetText, double fontSize = 18}) {
    return GoogleFonts.openSans(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.2);
  }

  static TextStyle openSans500(
      {Color color = ColorUtil.whitetText, double fontSize = 14}) {
    return GoogleFonts.openSans(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle genSans300({
    Color color = Colors.white,
    required double fontSize,
  }) {
    return TextStyle(
      fontFamily: 'General Sans',
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle genSans400({
    Color color = Colors.white,
    required double fontSize,
  }) {
    return TextStyle(
      fontFamily: 'General Sans',
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle genSans500({
    Color color = Colors.white,
    required double fontSize,
  }) {
    return TextStyle(
      fontFamily: 'General Sans',
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle genSans600({
    Color color = Colors.white,
    required double fontSize,
  }) {
    return TextStyle(
      fontFamily: 'General Sans',
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
    );
  }
}

extension AppText on String {
  String get string => this;

  Widget text300(double fontSize,
          {Color color = Colors.black, TextAlign? textAlign}) =>
      Text(
        string,
        textAlign: textAlign,
        style: TextStyle(
          fontFamily: 'General Sans',
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w300,
        ),
      );

  Widget text400(double fontSize,
          {Color color = Colors.black, TextAlign? textAlign}) =>
      Text(
        string,
        textAlign: textAlign,
        style: TextStyle(
          fontFamily: 'General Sans',
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
        ),
      );

  Widget text500(double fontSize,
          {Color color = Colors.black, TextAlign? textAlign}) =>
      Text(
        string,
        textAlign: textAlign,
        style: TextStyle(
          fontFamily: 'General Sans',
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      );

  Widget text600(double fontSize,
          {Color color = Colors.black,
          TextAlign? textAlign,
          TextStyle? style}) =>
      Text(
        string,
        textAlign: textAlign,
        style: style ??
            TextStyle(
              fontFamily: 'General Sans',
              color: color,
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
      );
}
