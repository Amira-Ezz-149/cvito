import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'message_bubble.dart';
class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('chat').orderBy("time",descending: true).snapshots(),
      builder: (ctx, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        final docs = snapShot.data!.docs;
        final user = FirebaseAuth.instance.currentUser;
        return ListView.builder(
          reverse: true,
          itemCount: docs.length,
          itemBuilder: (ctx,index){
            return MessageBubble(
                docs[index]['name'],
                docs[index]['text'],
                docs[index]['userId'] == user!.uid,
              key: ValueKey(docs[index].id),
            );
          },
          );
      },
    );
  }
}
