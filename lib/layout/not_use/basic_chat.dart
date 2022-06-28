import 'package:cvito/layout/widgets/lists.dart';
import 'package:flutter/material.dart';

import '../widgets/constants_color.dart';
import '../widgets/basic_constant_text.dart';
class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 15,top: 10),
      child: Row(
          children: List.generate(names.length, (index) {
        return Column(
          children: <Widget>[
            Stack(
              children:const  <Widget>[
                SizedBox(
                  width: 50,
                  height: 50,
                  child:CircleAvatar(
              radius: 40.0,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/images/person1.png'),),
                )],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 17,left: 23),
              child: SizedBox(
                width: 62,
                child: Align(
                    child: text(
                      text:names[index],
                      //overflow: TextOverflow.ellipsis,
                        colors: kGrayColor130,
                        size: 14,
                        fontWeight: FontWeight.w700,
                        spacing: 0.4,
                    )),
              ),
            )
          ],
        );
      })),
    );
  }
}
