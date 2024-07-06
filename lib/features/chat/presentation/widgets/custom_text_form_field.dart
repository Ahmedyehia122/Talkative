import 'package:chat_app/features/chat/data/cubits/chat_cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.controller,
    required this.email,
  });

  final TextEditingController? messageController = TextEditingController();
  final ScrollController? controller;
  final dynamic email;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: messageController,
      decoration: InputDecoration(
        hintText: 'send message',
        suffixIcon: IconButton(
          onPressed: () {
            if (messageController!.text.isNotEmpty) {
              BlocProvider.of<ChatCubit>(context).getMessages();
              BlocProvider.of<ChatCubit>(context).sendMesssage(
                message: messageController!.text,
                email: email,
              );
              messageController!.clear();
              controller!.animateTo(
                0,
                duration: const Duration(seconds: 2),
                curve: Curves.easeIn,
              );
            }
          },
          icon: const Icon(Icons.send),
        ),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
  );
}
