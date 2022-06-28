import 'package:cvito/layout/widgets/text_field_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'constants_color.dart';
import 'custom_button_with_text.dart';
import 'basic_constant_text.dart';
import 'lists.dart';
class AnimatedSocialLink extends StatefulWidget {
  const AnimatedSocialLink({Key? key}) : super(key: key);
  @override
  _AnimatedSocialLinkState createState() => _AnimatedSocialLinkState();
}

class _AnimatedSocialLinkState extends State<AnimatedSocialLink> {
  double _width = 328;
  double _height = 130;
  String? _selected;
  final TextEditingController _textEditingControllerSocialLink = TextEditingController();
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
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 19, left: 27, right: 141),
            child: text(
              text: "Social Links",
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
              text: "Add Social Link",
              onPressed: () {
                setState(() {
                  _updatestate();
                });
              },
              border: Border.all(color: kBasicColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140, left: 14,right: 9),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 90,
                    height: 51,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(4),
                      color:Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top:10),
                          child: DropdownButton<String>(
                            iconSize: 39,
                            isDense: true,
                            icon: Icon(Icons.arrow_drop_down,color: Colors.black87.withOpacity(0.2)),
                            hint: Image.asset("assets/images/linkedin.png"),
                            value: _selected,
                            onChanged: (newValue){
                              setState(() {
                                _selected = newValue;
                              });
                            },
                            items: images.map((map) {
                              return DropdownMenuItem<String>(
                                value: map['id'].toString(),
                                child: Row(
                                  children: [
                                    Image.asset(map['image'],width: 32,),
                                  ],
                                ),
                              );
                            }
                            ).toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 210,
                    height: 51,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(4)
                    ),
                    child: textFormField(
                        radious: 3,
                        type: TextInputType.name,
                        color: kBoxColor,
                        hint: "username",
                      controller: _textEditingControllerSocialLink
                    ),
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 229,left: 30,right: 30),
            child: ListTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                              text: _textEditingControllerSocialLink.text,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: kBasicColor
                              ),
                              recognizer: TapGestureRecognizer()..onTap = (){
                                launchUrlString(_textEditingControllerSocialLink.text);}
                          ),

                  ),
                ],
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.only(top: 278, left: 14,bottom: 30,right: 14),
            child: CustomButtonWithText(
              redus: 100,
              height: 35,
              width: 300,
              bottomColor: Colors.transparent,
              textColor: kBasicColor,
              text: "Remove",
              onPressed: (){
                setState(() {
                  _textEditingControllerSocialLink.clear();
                });
              },
              border: Border.all(color: kBasicColor),
            ),
          ),
        ],
      ),
    );
  }
}
