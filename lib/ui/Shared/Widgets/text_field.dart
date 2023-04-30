import 'package:chatgpt_app/data/repositories/openai_repository.dart';
import 'package:chatgpt_app/data/services/openai_service.dart';
import 'package:flutter/material.dart';




class AppTextField extends StatelessWidget {
  final TextEditingController controller;


  const AppTextField(
    this.controller,
 {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
height: 100,
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(
          top: BorderSide(
            color: Colors.black,
            width: 0.5,
          ),
        ),
      ),
      child:TextFormField(
        onFieldSubmitted: (e) {
          OpenAIRepository(e, openAIService: OpenAIService()).fetchPrompts();
          messageController.updateObjMessageController(
              {
                "isUser":true,
                "message":e
              }
          );
          messageController.objMessageController.refresh();
          controller.clear();

        },
        controller: controller,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: const InputDecoration(
          focusColor: Colors.white,
          filled: true,
          fillColor: Colors.black,
          suffixIcon: Icon(
            Icons.send,
            color: Color(0xffacacbe),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          border: OutlineInputBorder(

            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
        ),
      ),
    );
  }}

