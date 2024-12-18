import 'package:flutter/material.dart';
import 'hexColorToFlutterColor.dart';

extension ColorUtil on BuildContext {
  Color dynamicColor({required int light, required int dark}) {
    return (Theme.of(this).brightness == Brightness.light)
        ? Color(light)
        : Color(dark);
  }

  Color dynamicColour({required Color light, required Color dark}) {
    return (Theme.of(this).brightness == Brightness.light) ? light : dark;
  }

  Color get brandColor1 =>
      dynamicColour(light: HexColor("#5D48D0"), dark: HexColor("#000000"));

  Color get brandColor2 =>
      dynamicColour(light: HexColor("#8032A8"), dark: HexColor("#000000"));

  static get kcMediumGreyColor => null;

  static get kcPrimaryColor => null;

  static const Color neutral_3 = Color(0x00ffd200);
  static Color neutral_5 = HexColor("#FFD200");
  static const Color gradient_1 = Color.fromRGBO(0, 0, 0, 1);
  static const Color gradient_3 = Color.fromRGBO(0, 0, 0, 0.8);
  static const Color gradient_2 = Color.fromRGBO(0, 0, 0, 0);
  static const Color whitetrnsprnt = Color.fromRGBO(250, 250, 250, 0.9);
  static const Color whitetText = Color.fromRGBO(255, 255, 255, 1);
  static Color blackgrey = HexColor('#5D5D5D');
  static const Color nButtonColor = Color.fromRGBO(255, 210, 0, 1);
  static Color nButtonColorLight = HexColor('#FFF4BF');
  static const Color nButtonColorLight2 = Color.fromRGBO(255, 241, 229, 1);
  static Color nblackText = HexColor('#111111');

  static const Color nbrightnessIconC1 = Color.fromRGBO(255, 217, 38, 1);
  static const Color nbrightnessIconC2 = Color.fromRGBO(255, 237, 153, 1);
  static const Color nTextForm = Color.fromRGBO(43, 41, 32, 1);
  static const Color ncircleavatar = Color.fromRGBO(206, 206, 206, 1);
  static const Color ncompulsory = Color.fromRGBO(255, 46, 57, 1);
  static const Color ntransparentpage = Color.fromRGBO(17, 17, 17, 0.50);
  static const Color nblack07 = Color.fromRGBO(0, 0, 0, 0.20);
  static const Color transparentTab = Color.fromRGBO(0, 0, 0, 0.4);
  static Color restrReviewProfile = HexColor("#3A2115");
  static Color nblackText2 = HexColor("#CCC8B2");
  static Color blackgrey2 = HexColor("#373737");
  static Color paymentcardbackground = HexColor("#F6F6F6");
}
