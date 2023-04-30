import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../Shared/Widgets/prompt_card.dart';
import '../../Shared/Widgets/text_field.dart';
import 'home_view_model.dart';

class HomeView extends StatefulWidget {
  final HomeViewModel homeViewModel;
   HomeView({Key? key, required this.homeViewModel}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}
final ScrollController _scrollController = ScrollController();



class _HomeViewState extends State<HomeView> {
  @override
  void initState() {

    // // listen to changes in the listview and scroll to the end when new chat comes in
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels ==
    //       _scrollController.position.maxScrollExtent) {
    //     // do nothing when user scroll to the top
    //     return;
    //   }
      // if (_scrollController.offset >=
      //     _scrollController.position.maxScrollExtent) {
      //   _scrollController.animateTo(_scrollController.position.maxScrollExtent,
      //       duration: Duration(milliseconds: 500), curve: Curves.ease);
      // }

    super.initState();
  }
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:AppTextField(textEditingController),
      backgroundColor: const Color(0xffffF1F6F9),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("ChatGpt"),
        ),
        body: SafeArea(
          child:
          Center(
            child:
            Obx(()=>ListView.builder(
              controller: _scrollController,
              itemCount: widget.homeViewModel.messageController.objMessageController.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment:widget.homeViewModel.messageController.objMessageController[index]["isUser"]?Alignment.topRight:Alignment.topLeft,
                      child: UserMessage(text: widget.homeViewModel.messageController.objMessageController[index]["message"]??"", color:widget.homeViewModel.messageController.objMessageController[index]["isUser"]? const Color(0xffff394867):const Color(0xffff212A3E), icon: const Icon(Icons.confirmation_num_sharp), isUser:widget.homeViewModel.messageController.objMessageController[index]["isUser"] ,)),
                );
              },
            ),
              )


          ),
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
