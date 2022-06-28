import 'package:flutter/material.dart';

import 'constants_color.dart';
import 'basic_constant_text.dart';
import 'text_field_search.dart';
import 'custom_button_with_text.dart';

class AnimatedWebsite extends StatefulWidget {
  const AnimatedWebsite({Key? key}) : super(key: key);

  @override
  _AnimatedWebsiteState createState() => _AnimatedWebsiteState();
}

class _AnimatedWebsiteState extends State<AnimatedWebsite> {
  double _width = 328;
  double _height = 130;
  TextEditingController textEditingController = TextEditingController();
  _updatestate() {
    if(_height == 130){
    setState(() {
      _width = 328;
      _height = 348;
    });
    }else{
      setState(() {
        _width = 328;
        _height = 130;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: _width,
      height: _height,
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: Colors.grey.shade400, style: BorderStyle.solid)),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceOut,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 19, left: 27, right: 141),
            child: text(
              text: "Websites",
              colors: const Color.fromRGBO(51, 51, 51, 1),
              fontWeight: FontWeight.w400,
              size: 22,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 79, left: 14),
            child: CustomButtonWithText(
              redus: 100,
              height: 35,
              width: 300,
              bottomColor: Colors.transparent,
              textColor: kBasicColor,
              text: "Add Website",
              onPressed: () {
                setState(() {
                  _updatestate();
                });
              },
              border: Border.all(color: kBasicColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14,right: 14,top: 140),child: Container(
            width: 300,
            height: 51,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(4)
            ),
            child: textFormField(
                radious: 3,
                type: TextInputType.name,
                color: kBoxColor,
                hint: "Website address",
                controller: textEditingController
            ),
          ),),
          Padding(
            padding: const EdgeInsets.only(top: 229,left: 57),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/linkedin.png",height: 30,width: 30,),
                text(
                  text: textEditingController.text,
                  colors: kGrayColor,
                  fontWeight: FontWeight.w700,
                  size: 16,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 278, left: 14,bottom: 30,right: 14),
            child: CustomButtonWithText(
              redus: 10,
              height: 35,
              width: 300,
              bottomColor: Colors.transparent,
              textColor: kBasicColor,
              text: "Remove",
              onPressed: () {},
              border: Border.all(color: kBasicColor),
            ),
          ),
        ],
      ),
    );
  }
}
