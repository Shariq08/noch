import 'package:flutter/material.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';

import 'package:chat_message_timestamp/chat_message_timestamp.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({super.key, required this.message, required this.time});
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 100.w - 45.kw,
        ),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          )),
          color: ColorUtil.whitetText,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: TimestampedChatMessage(
            text: 'your message here',
            sentAt: '9:27',
          ),
          // Stack(
          //   children: [
          //     Padding(
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          //       child: Text(
          //         message,
          //         style: TextStyle(
          //           fontSize: 16,
          //         ),
          //       ),
          //     ),
          //     Positioned(
          //       bottom: 4,
          //       right: 8,
          //       child: Row(
          //         children: [
          //           Text(
          //             time,
          //             style: TextStyle(
          //               fontSize: 13,
          //               color: Colors.grey[600],
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
