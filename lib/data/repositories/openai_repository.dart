import 'dart:convert';
import 'package:chatgpt_app/Controller/MessageController.dart';
import 'package:get/get.dart';
import '../services/openai_service.dart';

MessageController messageController =Get.put(MessageController()) ;
class OpenAIRepository {
  final OpenAIService _openAIService;
  final String prompt;

  OpenAIRepository(this.prompt, {required OpenAIService openAIService})
      : _openAIService = openAIService;

   fetchPrompts() async
  {
    var response = await _openAIService.openAiService(prompt);
    var jsonData = json.decode(response.body);
    if(response.statusCode==200)
    {
      messageController.updateObjMessageController(
          {
            "isUser":false,
            "message":jsonData["choices"][0]["message"]["content"]
          }
          );
      messageController.objMessageController.refresh();
      print(messageController.objMessageController);
    }else
    {
      return [response.statusCode];
    }
  }

}