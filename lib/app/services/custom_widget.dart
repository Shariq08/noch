import 'package:flutter/material.dart';
import 'package:noch/app/constants/image_constant.dart';
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

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 30));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 22.kw,
            height: 14.kh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.orange, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, right: 0.0, left: 2.0),
              child: Container(
                alignment:
                    widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 15.0,
                  height: 15.0,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.orange),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class NCustomCard extends StatelessWidget {
  String title;
  String subtitle;
  String imgpath;
  bool isIcon;
  NCustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imgpath,
    required this.isIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: ColorUtil.whitetText,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: isIcon
                    ? EdgeInsets.only(top: 20)
                    : const EdgeInsets.only(top: 0),
                child: CircleAvatar(
                  radius: 20,
                  child: ClipOval(
                    child: Image.asset(
                      imgpath,
                      fit: BoxFit.cover,
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ),
              8.kwidthBox,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: TextStyleUtil.openSans600(
                              color: ColorUtil.nblackText),
                        ),
                        8.kwidthBox,
                        Text(
                          '2 hours ago',
                          style: TextStyleUtil.openSans600(
                              fontSize: 10, color: ColorUtil.blackgrey),
                        ),
                        Spacer(),
                        isIcon
                            ? IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_outline,
                                  size: 20,
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                    Text(
                      subtitle,
                      style: TextStyleUtil.openSans400(
                          color: ColorUtil.nblackText, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
