import 'package:cvito/constants/constants.dart';
import 'package:flutter/material.dart';

///used in notifications screen
class CustomListTileNotifications extends StatelessWidget {
  const CustomListTileNotifications({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 5, 16, 5),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 5), //(x,y)
              blurRadius: 5,
            ),
          ],
          color: Colors.grey.shade200,
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
          child: Image.asset('assets/images/profile_photo.png'),
        ),
        tileColor: Colors.grey,
        title: Row(
          children: const [
            Text(
              'Discover',
              style: TextStyle(
                  color: kCustomBlack,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0),
            ),
            Spacer(),
            Text(
              '7:36 AM',
              style: TextStyle(
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
