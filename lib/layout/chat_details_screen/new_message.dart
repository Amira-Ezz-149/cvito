import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cvito/layout/widgets/constants_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  TextEditingController controller = TextEditingController();
  String _enteredMessage = "";
  _sendMessage()async{
     FocusScope.of(context).unfocus();
     final user = await FirebaseAuth.instance.currentUser;
     final userdata = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
     FirebaseFirestore.instance
        .collection('chat')
        .add({
       'text': _enteredMessage,
       'time':Timestamp.now(),
       'name':userdata['name'],
       'userId':user.uid,
     });
    controller.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Container(

      //this is part of send new massage
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.only(left: 17,bottom: 25),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Write a message..",
                      isDense: false,
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(40)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(40)),
                      suffixIcon: SizedBox(
                        width: 80,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.attach_file_outlined),
                              iconSize: 22,
                              constraints: const BoxConstraints(maxWidth: 70),
                            ),
                            IconButton(
                              constraints: const BoxConstraints(maxWidth: 30),
                              onPressed: () {},
                              icon: const Icon(Icons.camera_alt_outlined),
                              iconSize: 22,
                            ),
                          ],
                        ),
                      ),
                      labelStyle: const TextStyle(
                          color: kGrayColor130,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                      filled: true,
                    ),
                    controller: controller,
                    minLines: 1,
                    keyboardType: TextInputType.multiline,
                    onChanged: (val){
                      setState(() {
                        _enteredMessage = val;
                      });
                    },

                )),
            // )),
            IconButton(
              color: Theme.of(context).primaryColor,
              icon: const Icon(Icons.send, size: 25,),
              onPressed: _enteredMessage.trim().isEmpty? null : _sendMessage,
            ),
          ],
        ));
  }
}
