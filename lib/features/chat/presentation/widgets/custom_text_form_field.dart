import 'package:chat_app/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key});
  CollectionReference messages =
      FirebaseFirestore.instance.collection(AppStrings.kMessagesCollection);
  TextEditingController? messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: messageController,
        decoration: InputDecoration(
          hintText: 'send message',
          suffixIcon: IconButton(
            onPressed: () {
              if (messageController!.text.isNotEmpty) {
                messages.add(
                  {'message': messageController!.text},
                );
                messageController!.clear();
              }
            },
            icon: const Icon(Icons.send),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
