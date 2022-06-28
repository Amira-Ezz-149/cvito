import 'package:flutter/material.dart';

import 'constants_color.dart';
import 'custom_button_with_text.dart';
import 'basic_constant_text.dart';

class ApplicantListTile extends StatelessWidget {
  ApplicantListTile({Key? key, required this.jobss,required this.location,required this.name}) : super(key: key);
 String? jobss;
 String? location;
 String? name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 130,
      margin: const EdgeInsets.fromLTRB(16, 5, 16, 5),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 3), //(x,y)
            blurRadius: 5,
          ),
        ],
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListTile(
        contentPadding:const EdgeInsets.only(top: 7,left: 27,bottom: 13,right: 20),
        dense: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            text(
              text:jobss,
              size: 14,
              fontWeight: FontWeight.w500,
              spacing: 0.5,
              colors: const Color.fromRGBO(79, 79, 79, 1)
            ),
            text(
                text:"Software Development(Permanent)",
                size: 13,
                fontWeight: FontWeight.w400,
                spacing: 0.5,
                colors: const Color.fromRGBO(79, 79, 79, 1)
            ),
            Row(
              children: [
                const Icon(Icons.location_on_outlined,size: 12,),
                text(
                    text:location,
                    size: 12,
                    fontWeight: FontWeight.w500,
                    spacing: 0.5,
                    colors: const Color.fromRGBO(189, 189, 189, 1)
                ),
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  child: Image.asset('assets/images/person1.png'),
                  backgroundColor: Colors.transparent,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: text(
                      text:name,
                      size: 12,
                      fontWeight: FontWeight.w400,
                      spacing: 0.5,
                      colors: const Color.fromRGBO(79, 79, 79, 1)
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: CustomButtonWithText(
                    redus: 100,
                    border: Border.all(color: Colors.transparent),
                    height: 19,
                    width: 100,
                    onPressed: (){},
                    text:"Desline",
                    textColor:const Color.fromRGBO(179, 38, 30, 1),
                    bottomColor: Colors.transparent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: CustomButtonWithText(
                    redus: 100,
                    border: Border.all(color: kBasicColor,width: 2,style: BorderStyle.solid),
                    height: 22,
                    width: 103,
                    onPressed: (){},
                    text:"Accept",
                    textColor: kBasicColor,
                    bottomColor: Colors.transparent,
                  ),
                ),
              ],
            )
          ],
        ),
        trailing: const Icon(Icons.more_vert_outlined),
      ),
    );
  }
}
