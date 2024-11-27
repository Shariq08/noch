import 'package:flutter/material.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

class RectangleTile extends StatelessWidget {
  final String path;
  const RectangleTile({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromRGBO(255, 255, 255, 1), width: 0.3),
        borderRadius: BorderRadius.circular(12),
        color: Colors.black,
      ),
      child: Image.asset(path),
    );
  }
}

class OtpField extends StatelessWidget {
  TextEditingController controller;
  final ValueChanged<String>? onChanged;

  OtpField({super.key, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.kh,
      width: 48.kw,
      decoration: BoxDecoration(
          color: ColorUtil.nTextForm,
          border: Border.all(width: 1.w),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      child: Center(
        child: TextField(
          controller: controller,
          maxLength: 1,
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.top,
          keyboardType: TextInputType.number,
          style: TextStyleUtil.openSans400(),
          decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            counterText: '',
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty) {
              FocusScope.of(context).previousFocus();
            }
            if (onChanged != null) {
              onChanged!(value);
            }
          },
        ),
      ),
    );
  }
}
