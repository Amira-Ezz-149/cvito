import 'package:cvito/some_helpers/constants/constants.dart';
import 'package:flutter/material.dart';

///used in notifications screen
class CustomListTileNotifications extends StatelessWidget {
 String? notificationTime;
 String? notificationImages;
 CustomListTileNotifications({required this.notificationTime, required this.notificationImages});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          border: Border.all(color: Colors.grey.shade200)),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: const BorderSide(
            color: Colors.black,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        dense: true,
        isThreeLine: true,
        leading: CircleAvatar(
          radius: 30,
          child: Image.asset(notificationImages!),
        ),
        tileColor: Colors.grey,
        title: Row(
          children:  [
            const Text(
              'Discover',
              style:  TextStyle(
                  color: kCustomBlack,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0),
            ),
            Spacer(),
            Text(
              notificationTime!,
              style:const TextStyle(
                  color: Color(0xff4F4F4F),
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0),
            ),
          ],
        ),
        subtitle: const Text(
          'You can discover other companies \njobs..',
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 14.0),
        ),
      ),
    );
  }
}