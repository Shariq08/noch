// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:noch/app/components/noch_appbar.dart';
// import 'package:noch/app/constants/image_constant.dart';
// import 'package:noch/app/modules/reservation/controllers/reservation_controller.dart';
// import 'package:noch/app/services/colors.dart';
// import 'package:noch/app/services/responsive_size.dart';
// import 'package:noch/app/services/text_style_util.dart';

// class ServerChatView extends GetView {
//   const ServerChatView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(ReservationController());
//     return Stack(children: [
//       Image.asset(
//         ImageConstant.restrback,
//         fit: BoxFit.cover,
//         height: double.infinity,
//         width: double.infinity,
//       ),
//       // IgnorePointer(
//       //   child: Container(
//       //     decoration: BoxDecoration(
//       //         gradient: LinearGradient(
//       //             begin: Alignment.topCenter,
//       //             end: Alignment.bottomCenter,
//       //             colors: [
//       //           ColorUtil.gradient_1,
//       //           ColorUtil.gradient_2,
//       //           ColorUtil.gradient_2,
//       //           ColorUtil.gradient_1,
//       //         ])),
//       //   ),
//       // ),
//       Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           leading: IconButton(
//             onPressed: () => Get.back(),
//             icon: Icon(Icons.arrow_back, color: ColorUtil.whitetText),
//           ),
//           title: Row(
//             children: [
//               ClipOval(
//                   child: Image.asset(
//                 ImageConstant.server,
//                 height: 40.kh,
//                 width: 40.kw,
//                 fit: BoxFit.cover,
//               )),
//               8.kwidthBox,
//               Text(
//                 'Peter Johnson',
//                 style: TextStyleUtil.openSans600(fontSize: 16),
//               )
//             ],
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
//           child: Container(
//             decoration: BoxDecoration(
//                 color: ColorUtil.whitetrnsprnt,
//                 borderRadius: BorderRadius.all(Radius.circular(24))),
//             child: Column(
//               children: [
//                 Expanded(
//                     child: Obx(() => ListView.builder(
//                         itemCount: controller.messages.length,
//                         reverse: true,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 8.0, horizontal: 16.0),
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Container(
//                                 padding: const EdgeInsets.all(12),
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey[200],
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: Text(
//                                   controller.messages[index],
//                                   style: TextStyle(fontSize: 14),
//                                 ),
//                               ),
//                             ),
//                           );
//                         }))),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: TextField(
//                           controller: controller.messageController,
//                           decoration: InputDecoration(
//                               hintText: 'Write a message..',
//                               hintStyle: TextStyleUtil.openSans400(
//                                   fontSize: 14, color: ColorUtil.nblackText),
//                               filled: true,
//                               fillColor: ColorUtil.whitetText,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(80),
//                                 borderSide: BorderSide.none,
//                               ),
//                               suffixIcon: IconButton(
//                                   onPressed: () {
//                                     controller.addMessage(
//                                         controller.messageController.text);
//                                     controller.messageController.clear();
//                                   },
//                                   icon: Icon(Icons.send,
//                                       color: ColorUtil.nblackText))),
//                         ),
//                       ),
//                       // SizedBox(width: 8),
//                       // GestureDetector(
//                       //   onTap: () {
//                       //     controller
//                       //         .addMessage(controller.messageController.text);
//                       //     controller.messageController.clear();
//                       //   },
//                       //   child: CircleAvatar(
//                       //     backgroundColor: Colors.blue,
//                       //     child: Icon(Icons.send, color: Colors.white),
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       )
//     ]);
//   }
// }
