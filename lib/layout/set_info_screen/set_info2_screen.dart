import 'package:cvito/layout/set_info_screen/set_info3_screen.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import '../widgets/constants_color.dart';
import '../widgets/custom_botton.dart';
import '../widgets/custom_button_with_text.dart';
import '../widgets/basic_constant_text.dart';
import '../widgets/text_field_search.dart';
import 'package:get/get.dart';
class SetInfo2 extends StatelessWidget {
  const SetInfo2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController numberEditingController = TextEditingController();
    TextEditingController industryEditingController = TextEditingController();
    TextEditingController specialtiesEditingController = TextEditingController();
    TextEditingController aboutYourselfEditingController = TextEditingController();
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Row(
              children: [
                CustomButtonWithIcon(
                    onPressed: (){
                      Get.back();
                    },
                    color: kGrayColor130,
                    size: 25,
                    icon: Icons.arrow_back),
                const SizedBox(width: 20,),
                text(
                    text: "Set up your info",
                    colors: kGrayColor,
                    size: 24,
                    fontWeight: FontWeight.w700),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 33,horizontal: 36),
                  child: text(
                      text: "Step  2/3",
                      spacing: 0.25,
                      colors: kGrayColor189,
                      size: 24,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            text(
                text: "Add information about you",
                colors: kBasicColor,
                size: 24,
                fontWeight: FontWeight.w700),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55,vertical: 20),
              child: Row(
                children: [
                  text(
                      text: "Add a phone number",
                      colors: kGrayColor130,
                      size: 16,
                      fontWeight: FontWeight.w400,
                    spacing: 0.5
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0,right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: kGrayColor242,
                    ),
                    width: 120,
                    height: 56,
                      child: Row(
                        children: [
                          CountryCodePicker(
                            initialSelection: 'Eg',
                            showCountryOnly: true,
                            showOnlyCountryWhenClosed: true,
                            hideMainText: true,
                            alignLeft:true,
                          ),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                  ),
                ),
                Expanded(
                  //flex: 0,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: kGrayColor242,
                      ),
                      height: 56,
                      child: textFormField(
                        controller: numberEditingController,
                        hint: '00 00 00 00 000',
                        hintstyle: const TextStyle(
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w400,
                          fontSize: 16
                        ),
                        radious: 4,
                        type: TextInputType.number,
                        color: kGrayColor242,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                      )

                  ),
                )
              ],
            ),
            const SizedBox(height: 20,),
            textFormField(
                validate: (String? value){
              return value;
            },
                controller: industryEditingController,
                radious: 4,
                hintstyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
                hint: "industry",
                type: TextInputType.name,
                color: kGrayColor242),
            const SizedBox(height: 20,),
            textFormField(
              validate: (String? value){
                return value;
              },
                controller: specialtiesEditingController,
                radious: 4,
                hintstyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
                hint: "company specialties",
                type: TextInputType.name,
                color: kGrayColor242),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  validator: (String? value){
                    return value;
                  },
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  controller: aboutYourselfEditingController,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Add a statement about yourself",
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(width: 1,color: Colors.black45)
                    ),
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                color: kBasicColor,
                width: 38,
                height: 6,
              ),),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(onPressed: (){
                    Get.back();
                  },text: "Previous",size: 18,color: kGrayColor130, fontWeight: FontWeight.w500,),
                  CustomButtonWithText(
                    redus: 100,
                    border: Border.all(color: kBasicColor,width: 2,style: BorderStyle.solid),
                      textColor: Colors.white,
                      width: 100,
                      height: 40,text: "Next", onPressed: (){
                    Get.to(const SetInfo3());
                  },bottomColor: kBasicColor,),
                ],
              ),
            ),
          ],
        ),
    ),
        ),
      ),
    );
  }
}
