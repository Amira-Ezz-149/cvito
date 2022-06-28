import 'package:flutter/material.dart';

import '../widgets/basic_constant_text.dart';

class Conversitionperson extends StatelessWidget {
  Conversitionperson({Key? key, required this.jobss,required this.name}) : super(key: key);
  String? jobss;
  String? name;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 25.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      trailing: const Icon(Icons.more_vert),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      isThreeLine: true,
      leading: const Padding(
        padding: EdgeInsets.only(left: 8.0,right: 10),
        child: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage("assets/images/person1.png",),
        ),
      ),
      tileColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          children: [
            SizedBox(
              width: 156,
              height: 26.47,
              child: text(
                text: name,
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
          text:jobss,
              colors: Colors.grey,
            fontWeight: FontWeight.w500, size: 14.0),

      ),
    );
  }
}
