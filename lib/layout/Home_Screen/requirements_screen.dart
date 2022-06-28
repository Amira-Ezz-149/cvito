import 'package:cvito/layout/widgets/constants_color.dart';
import 'package:cvito/layout/widgets/custom_tob_bar_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button_with_text.dart';
import '../widgets/basic_constant_text.dart';
import '../widgets/text_field_search.dart';
import '../widgets/lists.dart';

class RequirementsScreen extends StatefulWidget {

  const RequirementsScreen({Key? key}) : super(key: key);

  @override
  State<RequirementsScreen> createState() => _RequirementsScreenState();
}

class _RequirementsScreenState extends State<RequirementsScreen> {
  TextEditingController JobTitleController = TextEditingController();
  TextEditingController JobDescriptioneController = TextEditingController();
  String? _value1;
  String? _value2;
  String? _selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              //bar
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 16,right: 16,bottom: 38),
                child: CustomTopBar(
                    title: "requirements",
                    imageLink: 'assets/images/unsplash.png',
                    color: kGrayColor),
              ),
              ///////////////////////////////////////////////////
              //swcompany
              Padding(padding: const EdgeInsets.symmetric(vertical: 11,horizontal: 16),
                child: Container(
                  width: 330,
                  height: 100,
                  decoration: BoxDecoration(
                      color: kBasicColor,
                      borderRadius: BorderRadius.circular(3)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 27,bottom: 27,left: 15),
                        child: CircleAvatar(
                          radius: 25,
                          child: Image.asset("assets/images/unsplash.png",),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                       Padding(
                       padding: const EdgeInsets.only(top: 30,left: 8),
                       child: text(
                           size: 18,
                           text: "Software Company",
                           colors: kBoxColor,
                           fontWeight: FontWeight.w500
                       ),
                     ),
                       Padding(
                         padding: const EdgeInsets.only(top:10,left: 14,bottom: 23),
                         child: text(
                             size: 10,
                             text: "cairo ,Egypt",
                             colors: kBoxColor,
                             fontWeight: FontWeight.w500,
                             spacing: 1.5
                         ),
                       ),],),
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.only(top: 25, right: 8, bottom: 52,left: 10),
                          child: CustomButtonWithIcon(
                            color: kBoxColor,
                            onPressed: () {},
                            size: 25,
                            icon: Icons.create_sharp,
                          ),
                        ),
                      )
                    ],),
                ),
              ),
              ////////////////////////////////////////////////
              //job title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
              width: 328,
                 height: 73,
                 decoration: BoxDecoration(
                     color: const Color.fromRGBO(255, 255, 255, 0.95),
                     borderRadius: BorderRadius.circular(4),
                   border: Border.all(
                     width: 1.5,
                     color: Colors.black12
                   )
                 ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 16,top: 6),
                         child: text(
                          size: 12,
                          text: "Job tittle",
                          spacing: 0.4,
                          colors: const Color.fromRGBO(0, 119, 181, 1),
                          fontWeight: FontWeight.w500,
                      ),
                       ),
                       textFormField(
                         radious: 0,
                         color: kBoxColor,
                         type: TextInputType.multiline,
                           hintstyle: const TextStyle(
                               color: Color.fromRGBO(130, 130, 130, 1)
                           ),
                         hint: "Type your job tittle",
                         controller: JobTitleController
                       )
                    ],
                   ),
               ),
              ),
              ///////////////////////////////////////////////
              //job type and other RadioButton
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 32,top: 35,right: 231),
                    child: SizedBox(
                      width: 81,
                        height: 16,
                        child: text(
                          fontWeight: FontWeight.w500,
                          colors: kBasicColor,
                          size: 14,
                          text: "Job type"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left:38),
                    child: Row(
                      children: [
                        Radio(value: "Full time", groupValue: _value1, onChanged: (value){
                          setState(() {
                            _value1 = value as String?;
                          });
                        },
                        ),
                        text(text: "Full time",size: 14,fontWeight: FontWeight.w400,spacing: 0.25,colors: kGrayColor)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:38),
                    child: Row(
                      children: [
                        Radio(value: "part time", groupValue: _value1, onChanged: (value){
                          setState(() {
                            _value1 = value as String?;
                          });
                        }),
                        text(text: "Part time",size: 14,fontWeight: FontWeight.w400,spacing: 0.25,colors: kGrayColor)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32,top: 35,right: 231),
                    child: SizedBox(
                      width: 81,
                      height: 16,
                      child: text(
                          fontWeight: FontWeight.w500,
                          colors: kBasicColor,
                          size: 14,
                          text: "Other"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left:38),
                    child: Row(
                      children: [
                        Radio(value: "Remote", groupValue: _value2, onChanged: (value){
                          setState(() {
                            _value2 = value as String?;
                          });
                        },
                        ),
                        text(text: "Remote",size: 14,fontWeight: FontWeight.w400,spacing: 0.25,colors: kGrayColor)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:38),
                    child: Row(
                      children: [
                        Radio(value: "From Office", groupValue: _value2, onChanged: (value){
                          setState(() {
                            _value2 = value as String?;
                          });
                        }),
                        text(text: "From Office",size: 14,fontWeight: FontWeight.w400,spacing: 0.25,colors: kGrayColor)
                      ],
                    ),
                  ),
                ],
              ),
              /////////////////////////////////////////////
              //Applicant
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
                child: Container(
                  width: 328,
                  height: 70,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.95),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          width: 1.5,
                          color: Colors.black12
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16,top: 6,bottom: 9),
                        child: text(
                          size: 12,
                          text: "Applicant",
                          spacing: 0.4,
                          colors: const Color.fromRGBO(0, 119, 181, 1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  isDense: true,
                                  hint: text(
                                      text: "Choose applicant level",
                                      size: 15,
                                      spacing: 0.5,
                                      colors:
                                          const Color.fromRGBO(130, 130, 130, 1),
                                      fontWeight: FontWeight.w400),
                                  value: _selected,
                                  onChanged: (newValue){
                                    setState(() {
                                      _selected = newValue;
                                    });
                                  },
                                  items: applicant.map((map) {
                                    return DropdownMenuItem<String>(
                                      value: map['id'].toString(),
                                      child: Row(
                                        children: [
                                          Text(map['level']),
                                        ],
                                      ),
                                    );
                                  }
                                  ).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              ////////////////////////////////////////////
              //descripthion
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,),
                child: Container(
                  width: 328,
                  height: 73,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.95),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          width: 1.5,
                          color: Colors.black12
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16,top: 6),
                        child: text(
                          size: 12,
                          text: "Job description",
                          spacing: 0.4,
                          colors: const Color.fromRGBO(0, 119, 181, 1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      textFormField(
                          radious: 0,
                          hintstyle: const TextStyle(
                            color: Color.fromRGBO(130, 130, 130, 1)
                          ),
                          color: kBoxColor,
                          type: TextInputType.multiline,
                          hint: "Type your job description",
                          controller: JobDescriptioneController
                      )
                    ],
                  ),
                ),
              ),
              ///////////////////////////////////////
              // save an cancel
              Row(
                children: [
                Padding(
                  padding: const EdgeInsets.only(left: 41,right: 15,top: 15,bottom:50),
                  child: CustomButtonWithText(
                    redus: 6,
                    height: 44,
                    width: 172,
                    bottomColor: kBasicColor,
                    textColor: kBoxColor,
                    text: "Save",
                    onPressed: () {},
                    border: Border.all(color: kBasicColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10,top: 15,bottom:50),
                  child: CustomButtonWithText(
                    redus: 6,
                    height: 44,
                    width: 100,
                    bottomColor: kBoxColor,
                    textColor: kBasicColor,
                    text: "Cancel",
                    onPressed: () {},
                    border: Border.all(color: kBasicColor),
                  ),
                ),
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
