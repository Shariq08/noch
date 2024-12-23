import 'package:chat_message_timestamp/chat_message_timestamp.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/models/chat.dart';
import 'package:noch/app/services/chat_message_type.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/own_message_card.dart';
import 'package:noch/app/services/reply_card.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        ImageConstant.restrback,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
      // IgnorePointer(
      //   child: Container(
      //     decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //             begin: Alignment.topCenter,
      //             end: Alignment.bottomCenter,
      //             colors: [
      //           ColorUtil.gradient_1,
      //           ColorUtil.gradient_2,
      //           ColorUtil.gradient_2,
      //           ColorUtil.gradient_1,
      //         ])),
      //   ),
      // ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back, color: ColorUtil.whitetText),
          ),
          title: Row(
            children: [
              ClipOval(
                  child: Image.asset(
                ImageConstant.server,
                height: 40.kh,
                width: 40.kw,
                fit: BoxFit.cover,
              )),
              8.kwidthBox,
              Text(
                'Peter Johnson',
                style: TextStyleUtil.openSans600(fontSize: 16),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
          child: Container(
            decoration: BoxDecoration(
                color: ColorUtil.whitetrnsprnt,
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Column(
              children: [
                Expanded(
                  child: GestureDetector(
                      onTap: () {},
                      child: Obx(
                        () => ListView.separated(
                          shrinkWrap: true,
                          controller: controller.scrollController,
                          itemCount: controller.chatList.length,
                          itemBuilder: (context, index) {
                            return Align(
                              alignment: controller.chatList[index].type ==
                                      ChatMessageType.sent
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      controller.chatList[index].type ==
                                              ChatMessageType.sent
                                          ? MainAxisAlignment.end
                                          : MainAxisAlignment.start,
                                  children: [
                                    Visibility(
                                      visible:
                                          controller.chatList[index].type !=
                                              ChatMessageType.sent,
                                      child: Row(
                                        children: [
                                          ClipOval(
                                              child: Image.asset(
                                            ImageConstant.server,
                                            height: 32.kh,
                                            width: 32.kw,
                                            fit: BoxFit.cover,
                                          )),
                                          8.kwidthBox,
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      constraints:
                                          BoxConstraints(maxWidth: 80.w),
                                      decoration: BoxDecoration(
                                        color: ColorUtil.whitetText,
                                        borderRadius: BorderRadius.only(
                                          topLeft:
                                              controller.chatList[index].type ==
                                                      ChatMessageType.sent
                                                  ? Radius.circular(8)
                                                  : Radius.circular(0),
                                          topRight:
                                              controller.chatList[index].type ==
                                                      ChatMessageType.sent
                                                  ? Radius.circular(0)
                                                  : Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                      ),
                                      child: TimestampedChatMessage(
                                          text: controller
                                              .chatList[index].message,
                                          sentAt: controller
                                              .chatList[index].formattedTime,
                                          maxLines: 4,
                                          sentAtStyle:
                                              TextStyleUtil.openSans400(
                                                  fontSize: 12,
                                                  color: ColorUtil.nblackText4),
                                          style: TextStyleUtil.openSans600(
                                              color: ColorUtil.nblackText)),
                                    ),
                                    Visibility(
                                      visible:
                                          controller.chatList[index].type ==
                                              ChatMessageType.sent,
                                      child: Row(
                                        children: [
                                          8.kwidthBox,
                                          ClipOval(
                                              child: Image.asset(
                                            ImageConstant.userchat,
                                            height: 32.kh,
                                            width: 32.kw,
                                            fit: BoxFit.cover,
                                          )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return 15.kheightBox;
                          },
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller.textEditingController,
                          decoration: InputDecoration(
                              hintText: 'Write a message..',
                              hintStyle: TextStyleUtil.openSans400(
                                  fontSize: 14, color: ColorUtil.nblackText),
                              filled: true,
                              fillColor: ColorUtil.whitetText,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(80),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.onFieldSubmitted();
                                    controller.textEditingController.clear();
                                  },
                                  icon: Icon(Icons.send,
                                      color: ColorUtil.nblackText))),
                        ),
                      ),
                      // SizedBox(width: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
