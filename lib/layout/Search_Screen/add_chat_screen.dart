import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cvito/layout/widgets/text_field_search.dart';
import 'package:flutter/material.dart';
import '../widgets/constants_color.dart';
import '../chat_details_screen/chat_Screen.dart';
import '../widgets/custom_button_with_text.dart';
import '../widgets/basic_constant_text.dart';
import '../widgets/lists.dart';


class AddChatScreen extends StatefulWidget {
  const AddChatScreen({Key? key}) : super(key: key);

  @override
  _SearchChatState createState() => _SearchChatState();
}
class _SearchChatState extends State<AddChatScreen> {
  TextEditingController searchEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackGroundColor,
        appBar: AppBar(
          leading: CustomButtonWithIcon(onPressed: (){},color: kGrayColor130,size: 25,icon: Icons.arrow_back),
          backgroundColor: kBackGroundColor,
          elevation: 0.0,
          toolbarHeight: 90,
          title:textFormField(
            radious: 10,
            controller: searchEditingController,
            type: TextInputType.text,
            hint: "Type a name",
            color: kBoxColor,
            onChanged: (value) {
              setState(() {
                names = names.where((element) => element.contains(value)).toList();
              });
            },
            //prefix: Icons.search
          ),
        ),
        body:Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (ctx, snapShot) {
                if (snapShot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                final docs = snapShot.data!.docs;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: docs.length,
                  itemBuilder: (ctx,index){
                    DocumentSnapshot data = snapShot.data!.docs[index];
                    return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                            child: ListTile(
                              onTap: (){
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) =>  const ChatScreen()));
                              },
                              horizontalTitleGap: 25.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              trailing: const Icon(Icons.more_vert),
                              isThreeLine: true,
                              leading: const CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage("assets/images/person1.png",),

                              ),
                              tileColor: Colors.white,
                              title: Padding(
                                padding: const EdgeInsets.only(top: 22),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 156,
                                      height: 26.47,
                                      child: text(
                                          text: data['name'],
                                          colors: const Color.fromRGBO(51, 51, 51, 1),
                                          fontWeight: FontWeight.w700,
                                          size: 16.0),
                                    ),
                                  ],
                                ),
                              ),
                              subtitle: SizedBox(
                                width: 156,
                                height: 26.47,
                                child: text(
                                    text:"Android develober",
                                    colors: Colors.grey,
                                    fontWeight: FontWeight.w500, size: 14.0),

                              ),
                            ));
                  },
                );
              },
            ),
          ],
        )
    );
  }
}
