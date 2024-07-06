import 'package:chat_app/core/constants/colors.dart';
import 'package:chat_app/core/constants/images.dart';
import 'package:chat_app/core/constants/strings.dart';
import 'package:chat_app/core/constants/styles.dart';
import 'package:chat_app/core/customs/custom_chat_bubble.dart';
import 'package:chat_app/core/customs/custom_chat_bubble_for_friend.dart';
import 'package:chat_app/features/chat/data/models/message.dart';
import 'package:chat_app/features/chat/presentation/widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  final CollectionReference messages =
      FirebaseFirestore.instance.collection(AppStrings.kMessagesCollection);
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    return StreamBuilder<QuerySnapshot>(
      stream:
          messages.orderBy(AppStrings.kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (var i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(
              Message.fromJosn(snapshot.data!.docs[i]),
            );
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.kPrimaryColor,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.logoPath,
                    height: 25.h,
                    width: 25.w,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'Chat',
                    style: AppStyles.whiteFont,
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: controller,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return messagesList[index].id == email
                          ? CustomChatBubble(
                              message: messagesList[index],
                            )
                          : CustomChatBubbleForFriend(
                              message: messagesList[index],
                            );
                    },
                  ),
                ),
                CustomTextFormField(
                  controller: controller,
                  email: email,
                )
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.kPrimaryColor,
            ),
          );
        }
      },
    );
  }
}
