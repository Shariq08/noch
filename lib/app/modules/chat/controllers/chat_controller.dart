import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noch/app/models/chat.dart';

class ChatController extends GetxController {
  List<Chat> chatList = Chat.generate();

  late final ScrollController scrollController = ScrollController();
  late final TextEditingController textEditingController =
      TextEditingController();
  late final FocusNode focusNode = FocusNode();

  Future<void> onFieldSubmitted() async {
    if (!isTextFieldEnable) return;

    chatList = [
      ...chatList,
      Chat.sent(message: textEditingController.text),
    ];

    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    textEditingController.text = '';
  }

  void onFieldChanged(String term) {}

  bool get isTextFieldEnable => textEditingController.text.isNotEmpty;
}
