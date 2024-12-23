import 'package:intl/intl.dart';
import 'package:noch/app/services/chat_message_type.dart';

class Chat {
  final String message;
  final ChatMessageType type;
  final DateTime time;

  Chat({required this.message, required this.type, required this.time});

  factory Chat.sent({required message}) =>
      Chat(message: message, type: ChatMessageType.sent, time: DateTime.now());
  String get formattedTime => DateFormat('hh:mm a').format(time);
  static List<Chat> generate() {
    return [
      Chat(
        message: "Hello!",
        type: ChatMessageType.received,
        time: DateTime.now().subtract(const Duration(minutes: 15)),
      ),
      Chat(
        message: "How much time will take?",
        type: ChatMessageType.sent,
        time: DateTime.now().subtract(const Duration(minutes: 14)),
      ),
      Chat(
        message: "10 mins",
        type: ChatMessageType.received,
        time: DateTime.now().subtract(const Duration(minutes: 13)),
      ),
    ];
  }
}
