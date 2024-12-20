import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/models/chat.dart';
import 'package:noch/app/services/colors.dart';
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
                    child: Align(
                      // alignment: Alignment.topCenter,
                      child: ListView.separated(
                        shrinkWrap: true,
                        reverse: true,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 24),
                        separatorBuilder: (_, __) => SizedBox(
                          height: 8.kh,
                        ),
                        controller: controller.scrollController,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipOval(
                                  child: Image.asset(
                                ImageConstant.server,
                                height: 32.kh,
                                width: 32.kw,
                                fit: BoxFit.cover,
                              )),
                              Card(
                                elevation: 0,
                                color: ColorUtil.whitetText,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Hello !',
                                        style: TextStyleUtil.openSans600(
                                            fontSize: 18,
                                            color: ColorUtil.nblackText),
                                      ),
                                      SizedBox(
                                        width: 100.kw,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              '12:10 pm',
                                              style: TextStyleUtil.openSans400(
                                                  fontSize: 12,
                                                  color: ColorUtil.nblackText4),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ),
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
                                  onPressed: () {},
                                  icon: Icon(Icons.send,
                                      color: ColorUtil.nblackText))),
                        ),
                      ),
                      // SizedBox(width: 8),
                      // GestureDetector(
                      //   onTap: () {
                      //     controller
                      //         .addMessage(controller.messageController.text);
                      //     controller.messageController.clear();
                      //   },
                      //   child: CircleAvatar(
                      //     backgroundColor: Colors.blue,
                      //     child: Icon(Icons.send, color: Colors.white),
                      //   ),
                      // ),
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
