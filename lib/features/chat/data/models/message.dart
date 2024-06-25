import 'package:chat_app/core/constants/strings.dart';

class Message {
  final String message;

  Message({required this.message});
  factory Message.fromJosn(josn) {
    return Message(message: josn[AppStrings.kMessage]);
  }
}
