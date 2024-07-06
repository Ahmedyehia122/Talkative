import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.controller,
    required this.email,
  });

  final TextEditingController? messageController = TextEditingController();
  ScrollController? controller;
  final dynamic email;

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
