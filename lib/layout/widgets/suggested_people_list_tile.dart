import 'package:cvito/constants/constants.dart';
import 'package:flutter/material.dart';

class SuggestedPeopleListTile extends StatelessWidget {
  const SuggestedPeopleListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 10.0,
      horizontalTitleGap: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      trailing: const Icon(Icons.more_vert),
      contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
      isThreeLine: true,
      leading: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: CircleAvatar(
          radius: 35,
          child: Image.asset('assets/images/profile_photo.png'),
        ),
      ),
      tileColor: Colors.white,
      title: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Text(
              'Najy Eyad',
              style: TextStyle(
                  color: kCustomBlack,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0),
            ),
          ),
        ],
      ),
      subtitle: const Text(
        'Android Developer',
        style: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 14.0),
      ),
    );
  }
}
