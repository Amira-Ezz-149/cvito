import 'package:cvito/some_helpers/constants/constants.dart';
import 'package:flutter/material.dart';


///used in messages screen and notifications screen
class CustomListTileMessages extends StatelessWidget {

  String? user;
  String? imageLink;
  String? chatTime;

  CustomListTileMessages({required this.user, required this.imageLink, required this.chatTime});


  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: const EdgeInsets.fromLTRB(16, 5, 16, 5),
        decoration: BoxDecoration(
            boxShadow:  [
              BoxShadow(
                color: Colors.grey.shade400,
                offset: const Offset(0, 5), //(x,y)
                blurRadius: 5,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: Colors.grey.shade200),

        ),
        child: ListTile(
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(5),
          //   side: BorderSide(
          //     color: Colors.grey.shade200,
          //   ),
          // ),
          // tileColor: Colors.grey.shade200,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
          dense: true,
          isThreeLine: true,
          leading: CircleAvatar(
            radius: 30,

            // child: Image.asset('assets/images/profile_photo.png'),
            child: Image.asset(imageLink!),
          ),
          title: Row(
            children: [
              Text(
               user!,
                style: const TextStyle(
                    color: kCustomBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0),
              ),
             const Spacer(),
              Text(
                // '7:36 AM',
                chatTime!,
                style: const TextStyle(
                    color: Color(0xff4F4F4F),
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0),
              ),
            ],
          ),
          subtitle: const Text(
            "Hello, thanks for dicovering my CV i pleased to join your ....",
            style:  TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 14.0),
          ),
        ),
      );
  }

}