import 'package:bloc/bloc.dart';
import 'package:chat_app/core/constants/strings.dart';
import 'package:chat_app/features/chat/data/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  final CollectionReference messages =
      FirebaseFirestore.instance.collection(AppStrings.kMessagesCollection);

  sendMesssage({required String message, required String email}) {
    messages.add(
      {
        AppStrings.kMessage: message,
        AppStrings.kCreatedAt: DateTime.now(),
        'id': email,
      },
    );
  }

  getMessages() {
    messages
        .orderBy(AppStrings.kCreatedAt, descending: true)
        .snapshots()
        .listen(
      (event) {
        List<Message> messagesList = [];
        for (var doc in event.docs) {
          messagesList.add(Message.fromJosn(doc));
        }
        emit(ChatSuccessState(messagesList: messagesList));
      },
    );
  }
}
