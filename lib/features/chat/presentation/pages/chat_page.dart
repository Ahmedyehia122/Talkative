import 'package:chat_app/core/constants/colors.dart';
import 'package:chat_app/features/chat/presentation/widgets/custom_chat_bubble.dart';
import 'package:chat_app/features/chat/presentation/widgets/custom_chat_bubble_for_friend.dart';
import 'package:chat_app/features/chat/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/features/chat/presentation/widgets/custom_app_bar_logo.dart';
import 'package:chat_app/features/chat/presentation/widgets/custom_send_message_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const CustomAppBarLogo(),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                var messagesList =
                    BlocProvider.of<ChatCubit>(context).messagesList;
                return ListView.builder(
                  reverse: true,
                  controller: controller,
                  itemCount: messagesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return messagesList[index].id == email
                        ? CustomChatBubble(
                            message: messagesList[index],
                          )
                        : CustomChatBubbleForFriend(
                            message: messagesList[index],
                          );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: CustomSendMessageTextField(
              controller: controller,
              email: email,
            ),
          )
        ],
      ),
    );
  }
}
