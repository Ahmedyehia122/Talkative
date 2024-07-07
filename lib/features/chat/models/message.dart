import 'package:chat_app/core/constants/strings.dart';

class Message {
  final String message;
  final String id;

  Message({
    required this.id,
    required this.message,
  });
  factory Message.fromJosn(josn) {
    return Message(
      id: josn['id'],
      message: josn[AppStrings.kMessage],
    );
  }
}
