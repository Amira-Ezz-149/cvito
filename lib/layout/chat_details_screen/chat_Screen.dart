import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/constants_color.dart';
import '../widgets/custom_button_with_text.dart';
import '../widgets/basic_constant_text.dart';
import 'message.dart';
import 'new_message.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 90,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: CustomButtonWithIcon(onPressed: (){Get.back();},color: kGrayColor,size: 25,icon: Icons.arrow_back),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 140,top: 30),
            child: text(
                text: "Najy Ayad",
                colors: kGrayColor,
                size: 17,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          child: Column(
            children:  const [
              Expanded(child: Messages(),),
              NewMessage(),
            ],
          ),
        ),
      ),
    );
  }
}
