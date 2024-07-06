import 'package:chat_app/core/constants/colors.dart';
import 'package:chat_app/core/constants/images.dart';
import 'package:chat_app/core/constants/styles.dart';
import 'package:chat_app/core/customs/custom_chat_bubble.dart';
import 'package:chat_app/core/customs/custom_chat_bubble_for_friend.dart';
import 'package:chat_app/features/chat/data/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/features/chat/presentation/widgets/custom_text_form_field.dart';
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
            child: CustomTextFormField(
              controller: controller,
              email: email,
            ),
          )
        ],
      ),
    );
  }
}
