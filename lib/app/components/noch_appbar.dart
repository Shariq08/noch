import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/text_style_util.dart';

class NochAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasLeading;
  final VoidCallback? onLeadingPressed;
  final List<Widget> actions;

  const NochAppbar({
    required this.title,
    this.hasLeading = true,
    this.onLeadingPressed,
    this.actions = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(title, style: TextStyleUtil.openSans600(fontSize: 18)),
      leading: hasLeading
          ? IconButton(
              onPressed: onLeadingPressed ?? () => Get.back(),
              icon: Icon(Icons.arrow_back, color: ColorUtil.whitetText),
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
