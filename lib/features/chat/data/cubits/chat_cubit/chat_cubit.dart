import 'package:bloc/bloc.dart';
import 'package:chat_app/features/chat/data/models/message.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.message) : super(ChatInitial());
  final Message message;
}
