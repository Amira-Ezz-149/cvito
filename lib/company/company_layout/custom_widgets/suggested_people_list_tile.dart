import 'package:cvito/some_helpers/constants/constants.dart';
import 'package:flutter/material.dart';

class SuggestedPeopleListTile extends StatelessWidget {

  String? relatedPeopleName;
  String? relatedPeopleJobTitle;
  String? relatedPeopleImages;

  SuggestedPeopleListTile({required this.relatedPeopleImages, required this.relatedPeopleName, required this.relatedPeopleJobTitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 15.0,
      horizontalTitleGap: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      // trailing: const Icon(Icons.more_vert),
      contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
      isThreeLine: true,
      leading: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: CircleAvatar(
          backgroundImage: AssetImage(relatedPeopleImages!),
          radius: 35,
        ),
      ),
      tileColor: Colors.white,
      title: Row(
        children:  [
          Padding(
            padding:const EdgeInsets.only(bottom: 5.0),
            child: Text(
              relatedPeopleName!,
              style:const TextStyle(
                  color: kCustomBlack,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0),
            ),
          ),
        ],
      ),
      subtitle:  Text( relatedPeopleJobTitle!,
        style:const TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 14.0),
      ),
    );
  }
}
