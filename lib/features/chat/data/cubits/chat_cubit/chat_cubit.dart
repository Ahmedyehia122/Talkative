import 'package:bloc/bloc.dart';
import 'package:chat_app/core/constants/strings.dart';
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
        emit(ChatSuccessState());
      },
    );
  }
}
